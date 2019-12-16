//
//  HitchhikerTripRequestsViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 10.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

extension HitchhikerTripRequestsViewController: HitchhikerTripRequestsDataSourceDelegate {
    func showAlertMsg(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func loadData() {
        tripRequestTableView.reloadData()
    }
}

extension HitchhikerTripRequestsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if !hitchhikerTripRequestsDataSource.requestExist {
            return nil
        }
        switch section {
        case 0:
            return "Accepted Trip Requests"
        case 1:
            return "Waiting Trip Requests"
        case 2:
            return "Rejected Trip Requests"
        default: return nil
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if hitchhikerTripRequestsDataSource.requestExist {
            return 3
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !hitchhikerTripRequestsDataSource.requestExist {
            return 1
        }
        switch section {
        case 0:
            if !hitchhikerTripRequestsDataSource.acceptedRequests.isEmpty {
                return hitchhikerTripRequestsDataSource.acceptedRequests.count
            } else {
                return 1
            }
        case 1:
            if !hitchhikerTripRequestsDataSource.waitingRequests.isEmpty {
                return hitchhikerTripRequestsDataSource.waitingRequests.count
            } else {
                return 1
            }
        case 2:
            if !hitchhikerTripRequestsDataSource.rejectedRequests.isEmpty {
                return hitchhikerTripRequestsDataSource.rejectedRequests.count
            } else {
                return 1
            }
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if !hitchhikerTripRequestsDataSource.requestExist {
            let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
            cell.messageTextField.text = "You haven't make any request yet"
            return cell
        }
        switch indexPath.section {
        case 0:
            if !hitchhikerTripRequestsDataSource.acceptedRequests.isEmpty {
                var trip = hitchhikerTripRequestsDataSource.acceptedRequests[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: "TripRequestCell", for: indexPath) as! HitchhikerTripRequestTableViewCell
                
                let ratingImageNamesArray = hitchhikerTripRequestsHelper.getRatingImageArray(rating: trip.rating)
                
                cell.starOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
                cell.starTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
                cell.starThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
                cell.starFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
                cell.starFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
                cell.usernameLabel.text = trip.driverUserName
                //cell.carModelLabel.text = trip.carModel
                cell.carModelLabel.text = trip.carModel
                cell.statusLabel.text = "Accepted"
                cell.fromLabel.text = trip.from
                cell.toLabel.text = trip.to
                cell.minDepartureTimeLabel.text = trip.startTime.convertUtcToDisplay()
                cell.maxDepartureTimeLabel.text = trip.endTime.convertUtcToDisplay()
                /*
                 if let profileImage = trip.profileImage {
                 cell.profileImageView.image = profileImage
                 }
                 */
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
                cell.messageTextField.text = "You don't have any accepted trip request"
                return cell
            }
        case 1:
            if !hitchhikerTripRequestsDataSource.waitingRequests.isEmpty {
                var trip = hitchhikerTripRequestsDataSource.waitingRequests[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: "TripRequestCell", for: indexPath) as! HitchhikerTripRequestTableViewCell
                
                let ratingImageNamesArray = hitchhikerTripRequestsHelper.getRatingImageArray(rating: trip.rating)
                
                cell.starOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
                cell.starTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
                cell.starThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
                cell.starFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
                cell.starFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
                cell.usernameLabel.text = trip.driverUserName
                //cell.carModelLabel.text = trip.carModel
                cell.carModelLabel.text = trip.carModel
                cell.statusLabel.text = "Waiting"
                cell.fromLabel.text = trip.from
                cell.toLabel.text = trip.to
                cell.minDepartureTimeLabel.text = trip.startTime.convertUtcToDisplay()
                cell.maxDepartureTimeLabel.text = trip.endTime.convertUtcToDisplay()
                /*
                 if let profileImage = trip.profileImage {
                 cell.profileImageView.image = profileImage
                 }
                 */
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
                cell.messageTextField.text = "You don't have any waiting trip request"
                return cell
            }
        case 2:
            if !hitchhikerTripRequestsDataSource.rejectedRequests.isEmpty {
                var trip = hitchhikerTripRequestsDataSource.rejectedRequests[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: "TripRequestCell", for: indexPath) as! HitchhikerTripRequestTableViewCell
                
                let ratingImageNamesArray = hitchhikerTripRequestsHelper.getRatingImageArray(rating: trip.rating)
                
                cell.starOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
                cell.starTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
                cell.starThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
                cell.starFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
                cell.starFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
                cell.usernameLabel.text = trip.driverUserName
                //cell.carModelLabel.text = trip.carModel
                cell.carModelLabel.text = trip.carModel
                cell.statusLabel.text = "Rejected"
                cell.fromLabel.text = trip.from
                cell.toLabel.text = trip.to
                cell.minDepartureTimeLabel.text = trip.startTime.convertUtcToDisplay()
                cell.maxDepartureTimeLabel.text = trip.endTime.convertUtcToDisplay()
                /*
                 if let profileImage = trip.profileImage {
                 cell.profileImageView.image = profileImage
                 }
                 */
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
                cell.messageTextField.text = "You don't have any rejected trip request"
                return cell
            }
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
            cell.messageTextField.text = "Error?"
            return cell
        }
    }
}

class HitchhikerTripRequestsViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var tripRequestTableView: UITableView!
    
    var hitchhikerTripRequestsDataSource = HitchhikerTripRequestsDataSource()
    var hitchhikerTripRequestsHelper = HitchhikerTripRequestsHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Trip Requests"
        // Do any additional setup after loading the view.
        tripRequestTableView.dataSource = self
        tripRequestTableView.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Vote Trips", style: .plain, target: self, action: #selector(voteTripButtonTapped))
        
        hitchhikerTripRequestsDataSource.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        if let username = userDefaults.string(forKey: "username") {
            hitchhikerTripRequestsDataSource.getPageData(hitchhikerUsername: username)
        }
    }
    
    @objc func voteTripButtonTapped() {
         performSegue(withIdentifier: "toHitchhikerVotePage", sender: nil)
     }
}
