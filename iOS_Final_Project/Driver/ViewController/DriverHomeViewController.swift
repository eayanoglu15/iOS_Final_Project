//
//  DriverHomeViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 10.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

extension DriverHomeViewController: DriverHomeDataSourceDelegate {
    func deleteRow(indexPath: IndexPath) {
        //requestTableView.deleteRows(at: [indexPath], with: .automatic)
        if let driver = driverHomeDataSource.driver {
            driverHomeDataSource.getHomePageData(driverName: driver.username)
        }
        requestTableView.reloadData()
    }
    
    func showAlertMsg(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    }
    
    func loadHomePageData() {
        requestTableView.reloadData()
    }
}

class DriverHomeViewController: UIViewController {
    var driverHomeHelper = DriverHomeHelper()
    var driverHomeDataSource = DriverHomeDataSource()
    
    @IBOutlet weak var requestTableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Driver Home"
        // Do any additional setup after loading the view.
        requestTableView.delegate = self
        requestTableView.dataSource = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(profileButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Vote Trips", style: .plain, target: self, action: #selector(voteTripButtonTapped))
        driverHomeDataSource.delegate = self
        
        refreshControl.addTarget(self, action:  #selector(reloadData), for: .valueChanged)
        requestTableView.refreshControl = refreshControl
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        if let username = userDefaults.string(forKey: "username") {
            driverHomeDataSource.getUser(username: username)
            driverHomeDataSource.getHomePageData(driverName: username)
        }
    }
    
    @objc func voteTripButtonTapped() {
        performSegue(withIdentifier: "toDriverVotePage", sender: nil)
    }
    
    @objc func profileButtonTapped() {
        performSegue(withIdentifier: "toDriverProfile", sender: nil)
    }
    
    @objc func newFeedButtonTapped() {
        performSegue(withIdentifier: "toNewTrip", sender: nil)
    }
    
    @objc func reloadData() {
        let userDefaults = UserDefaults.standard
        if let username = userDefaults.string(forKey: "username") {
            driverHomeDataSource.getUser(username: username)
            driverHomeDataSource.getHomePageData(driverName: username)
        }
        requestTableView.refreshControl?.endRefreshing()
        requestTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDriverProfile" {
            let destinationVc = segue.destination as! DriverProfileViewController
            destinationVc.driverProfileDataSource.driver = driverHomeDataSource.driver
        }
        
        if segue.identifier == "toNewTrip" {
            let destinationVc = segue.destination as! DriverNewTripViewController
            destinationVc.driverNewTripDataSource.driver = driverHomeDataSource.driver
            destinationVc.driverNewTripDataSource.getFromTo()
            
        }
        
        if segue.identifier == "toDriverVotePage" {
            let destinationVc = segue.destination as! DriverVotePageViewController
            destinationVc.driverVotePageDataSource.driver = driverHomeDataSource.driver
        }
        
        if segue.identifier == "toOtherProfileFromDriverHome" {
            let destinationVc = segue.destination as! DriverOtherProfileViewController
            destinationVc.driverOtherProfileDataSource.otherUsername = driverHomeHelper.selectedUsername
        }
    }
}


extension DriverHomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch driverHomeDataSource.status {
        case Status.noTrip:
            return 1
        case Status.noRequest:
            return 1
        case Status.allWaiting:
            return 1
        case Status.acceptedAndWaiting:
            return 2
        case Status.allAccepted:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch driverHomeDataSource.status {
        case Status.noTrip:
            return nil
        case Status.noRequest:
            return nil
        case Status.allWaiting:
            return "Waiting Requests"
        case Status.acceptedAndWaiting:
            switch section {
            case 0: return "Accepted Requests"
            case 1: return "Waiting Requests"
            default: return nil
            }
        case Status.allAccepted:
            return "Accepted Requests"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch driverHomeDataSource.status {
        case Status.noTrip:
            return 1
        case Status.noRequest:
            return 1
        case Status.allWaiting:
            return driverHomeDataSource.waitingRequests.count
        case Status.acceptedAndWaiting:
            switch section {
            case 0: return driverHomeDataSource.acceptedRequests.count
            case 1: return driverHomeDataSource.waitingRequests.count
            default: return 0
            }
        case Status.allAccepted:
            return driverHomeDataSource.acceptedRequests.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch driverHomeDataSource.status {
        case Status.noTrip:
            let cell = tableView.dequeueReusableCell(withIdentifier: "newTripCell", for: indexPath) as! NewTripTableViewCell
            cell.messageLabel.text = "You haven't post a trip yet... \nPost your next trip :)"
            cell.button.setTitle("New Trip", for: .normal)
            cell.button.addTarget(self, action: #selector(newFeedButtonTapped), for: .touchUpInside)
            return cell
            
        case Status.noRequest:
            let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
            cell.messageTextField.text = "No hitchhiker send a request yet"
            return cell
            
        case Status.allWaiting:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HitchhikerCell", for: indexPath) as! HitchhikerTableViewCell
            
            let tripRequest = driverHomeDataSource.waitingRequests[indexPath.row]
        
            let ratingImageNamesArray = driverHomeHelper.getRatingImageArray(rating: tripRequest.rating)
            
            cell.starOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
            cell.starTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
            cell.starThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
            cell.starFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
            cell.starFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
            let dataDecoded : Data = Data(base64Encoded: tripRequest.image, options: .ignoreUnknownCharacters)!
            cell.profileImageView.image = UIImage(data: dataDecoded)!
            cell.usernameLabel.text = tripRequest.hitchHikerUserName
            
            return cell
            
        case Status.acceptedAndWaiting:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HitchhikerCell", for: indexPath) as! HitchhikerTableViewCell
            
            var tripRequest: TripRequest
            if indexPath.section == 0 {
                tripRequest = driverHomeDataSource.acceptedRequests[indexPath.row]
            } else {
                tripRequest = driverHomeDataSource.waitingRequests[indexPath.row]
            }
            
            let ratingImageNamesArray = driverHomeHelper.getRatingImageArray(rating: tripRequest.rating)
            
            cell.starOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
            cell.starTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
            cell.starThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
            cell.starFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
            cell.starFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
            let dataDecoded : Data = Data(base64Encoded: tripRequest.image, options: .ignoreUnknownCharacters)!
            cell.profileImageView.image = UIImage(data: dataDecoded)!
            cell.usernameLabel.text = tripRequest.hitchHikerUserName
            
            return cell
            
        case Status.allAccepted:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HitchhikerCell", for: indexPath) as! HitchhikerTableViewCell
            
            let tripRequest = driverHomeDataSource.acceptedRequests[indexPath.row]
            
            let ratingImageNamesArray = driverHomeHelper.getRatingImageArray(rating: tripRequest.rating)
            
            cell.starOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
            cell.starTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
            cell.starThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
            cell.starFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
            cell.starFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
            let dataDecoded : Data = Data(base64Encoded: tripRequest.image, options: .ignoreUnknownCharacters)!
            cell.profileImageView.image = UIImage(data: dataDecoded)!
            cell.usernameLabel.text = tripRequest.hitchHikerUserName
            
            return cell
        }
    }
}

extension DriverHomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        switch driverHomeDataSource.status {
        case Status.noTrip:
            return nil
        case Status.noRequest:
            return nil
        case Status.allWaiting:
            let tripAcceptAction = self.driverHomeDataSource.contextualTripAcceptAction(forRowAtIndexPath: indexPath)
            let tripDenyAction = self.driverHomeDataSource.contextualTripDenyAction(forRowAtIndexPath: indexPath)
            let swipeConfig = UISwipeActionsConfiguration(actions: [tripAcceptAction, tripDenyAction])
            return swipeConfig
        case Status.acceptedAndWaiting:
            guard indexPath.section == 1 else {
                return nil
            }
            let tripAcceptAction = self.driverHomeDataSource.contextualTripAcceptAction(forRowAtIndexPath: indexPath)
            let tripDenyAction = self.driverHomeDataSource.contextualTripDenyAction(forRowAtIndexPath: indexPath)
            let swipeConfig = UISwipeActionsConfiguration(actions: [tripAcceptAction, tripDenyAction])
            return swipeConfig
        case Status.allAccepted:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("status: ", driverHomeDataSource.status)
        switch driverHomeDataSource.status {
        case Status.noTrip:
            return
        case Status.noRequest:
            return
        case Status.allWaiting:
            let hitchhikerRequest = driverHomeDataSource.waitingRequests[indexPath.row]
            driverHomeHelper.selectedUsername = hitchhikerRequest.hitchHikerUserName
            print("driverHomeHelper.selectedUsername: ", driverHomeHelper.selectedUsername)
            print("hitchhikerRequest.hitchHikerUserName: ", hitchhikerRequest.hitchHikerUserName)
            performSegue(withIdentifier: "toOtherProfileFromDriverHome", sender: nil)
        case Status.acceptedAndWaiting:
            let hitchhikerRequest = (indexPath.section == 0) ? driverHomeDataSource.acceptedRequests[indexPath.row] : driverHomeDataSource.waitingRequests[indexPath.row]
            driverHomeHelper.selectedUsername = hitchhikerRequest.hitchHikerUserName
            print("driverHomeHelper.selectedUsername: ", driverHomeHelper.selectedUsername)
            print("hitchhikerRequest.hitchHikerUserName: ", hitchhikerRequest.hitchHikerUserName)
            performSegue(withIdentifier: "toOtherProfileFromDriverHome", sender: nil)
        case Status.allAccepted:
            let hitchhikerRequest = driverHomeDataSource.acceptedRequests[indexPath.row]
            driverHomeHelper.selectedUsername = hitchhikerRequest.hitchHikerUserName
            print("driverHomeHelper.selectedUsername: ", driverHomeHelper.selectedUsername)
            print("hitchhikerRequest.hitchHikerUserName: ", hitchhikerRequest.hitchHikerUserName)
            performSegue(withIdentifier: "toOtherProfileFromDriverHome", sender: nil)
        }
    }
}
