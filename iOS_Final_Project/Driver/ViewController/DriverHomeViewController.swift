//
//  DriverHomeViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 10.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

extension DriverHomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Accepted Requests"
        case 1: return "Waiting Requests"
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return driverHomeDataSource.acceptedRequests.count
        case 1: return driverHomeDataSource.waitingRequests.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        
        cell.usernameLabel.text = tripRequest.hitchHikerUserName
        
        return cell
    }
}

extension DriverHomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard indexPath.section == 1 else {
            return nil
        }
        let tripAcceptAction = self.driverHomeDataSource.contextualTripAcceptAction(forRowAtIndexPath: indexPath)
        let tripDenyAction = self.driverHomeDataSource.contextualTripDenyAction(forRowAtIndexPath: indexPath)
        let swipeConfig = UISwipeActionsConfiguration(actions: [tripAcceptAction, tripDenyAction])
        return swipeConfig
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hitchhikerRequest = (indexPath.section == 0) ? driverHomeDataSource.acceptedRequests[indexPath.row] : driverHomeDataSource.waitingRequests[indexPath.row]
        driverHomeHelper.selectedUsername = hitchhikerRequest.hitchHikerUserName
        performSegue(withIdentifier: "toOtherProfileFromDriverHome", sender: nil)
    }
    
}

class DriverHomeViewController: UIViewController {
    var driverHomeHelper = DriverHomeHelper()
    var driverHomeDataSource = DriverHomeDataSource()
    
    @IBOutlet weak var requestTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Driver Home"
        // Do any additional setup after loading the view.
        requestTableView.delegate = self
        requestTableView.dataSource = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(profileButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New Feed", style: .plain, target: self, action: #selector(newFeedButtonTapped))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        if let username = userDefaults.string(forKey: "username") {
            driverHomeDataSource.getUser(username: username)
        }
    }
    
    @objc func profileButtonTapped() {
        //navigationController?.popToRootViewController(animated: false)
        performSegue(withIdentifier: "toDriverProfile", sender: nil)
    }
    
    @objc func newFeedButtonTapped() {
        performSegue(withIdentifier: "toNewTrip", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDriverProfile" {
            let destinationVc = segue.destination as! DriverProfileViewController
            destinationVc.driverProfileDataSource.driver = driverHomeDataSource.driver
        }
        
        if segue.identifier == "toNewTrip" {
            let destinationVc = segue.destination as! DriverNewTripViewController
            destinationVc.driverNewTripDataSource.driver = driverHomeDataSource.driver
        }
        
        if segue.identifier == "toOtherProfileFromDriverHome" {
            let destinationVc = segue.destination as! DriverOtherProfileViewController
            destinationVc.driverOtherProfileDataSource.otherUsername = driverHomeHelper.selectedUsername
        }
    }
}

