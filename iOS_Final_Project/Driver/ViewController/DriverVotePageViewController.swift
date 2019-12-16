//
//  DriverVotePageViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 16.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

extension DriverVotePageViewController: DriverVotePageDataSourceDelegate {
    func reloadTableView() {
        voteTableView.reloadData()
    }
    
    func showAlertMsg(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func loadVotePageData() {
        voteTableView.reloadData()
    }
}

extension DriverVotePageViewController: DriverVoteTableViewCellDelegate {
    func giveVote(tripId: Int, vote: Int) {
        driverVotePageDataSource.giveVoteForTrip(tripId: tripId, vote: vote)
    }
}

class DriverVotePageViewController: UIViewController {
    @IBOutlet weak var voteTableView: UITableView!
    
    var driverVotePageDataSource = DriverVotePageDataSource()
    var driverVotePageHelper = DriverVotePageHelper()
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Driver Vote Page"
        voteTableView.dataSource = self
        driverVotePageDataSource.delegate = self
        refreshControl.addTarget(self, action:  #selector(reloadData), for: .valueChanged)
        voteTableView.refreshControl = refreshControl
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let user = driverVotePageDataSource.driver {
            driverVotePageDataSource.getVotePageData(username: user.username)
        }
    }
    
    @objc func reloadData() {
        if let user = driverVotePageDataSource.driver {
            driverVotePageDataSource.getVotePageData(username: user.username)
        }
        voteTableView.refreshControl?.endRefreshing()
        voteTableView.reloadData()
    }
}

extension DriverVotePageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        switch driverVotePageDataSource.status {
        case VotePageStatus.noTrip:
            return 1
        case VotePageStatus.noRequest:
            return 1
        case VotePageStatus.allWaitingForVote:
            return 2
        case VotePageStatus.waitingAndVoted:
            return 2
        case VotePageStatus.allVoted:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch driverVotePageDataSource.status {
        case VotePageStatus.noTrip:
            return nil
        case VotePageStatus.noRequest:
            return nil
        case VotePageStatus.allWaitingForVote,
             VotePageStatus.waitingAndVoted,
             VotePageStatus.allVoted:
            switch section {
            case 0: return "Voted Trips"
            case 1: return "Waiting For Voting"
            default: return nil
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch driverVotePageDataSource.status {
        case VotePageStatus.noTrip:
            return 1
        case VotePageStatus.noRequest:
            return 1
        case VotePageStatus.allWaitingForVote:
            switch section {
            case 0:
                return 1
            case 1:
                return driverVotePageDataSource.nonVotedTrips.count
            default: return 0
            }
        case VotePageStatus.waitingAndVoted:
            switch section {
            case 0:
                return driverVotePageDataSource.votedTrips.count
            case 1:
                return driverVotePageDataSource.nonVotedTrips.count
            default: return 0
            }
        case VotePageStatus.allVoted:
            switch section {
            case 0:
                return driverVotePageDataSource.votedTrips.count
            case 1:
                return 1
            default: return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch driverVotePageDataSource.status {
        case VotePageStatus.noTrip:
            let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
            cell.messageTextField.text = "You haven't finished a trip yet"
            return cell
        case VotePageStatus.noRequest:
            let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
            cell.messageTextField.text = "No hitchhiker send a request yet"
            return cell
        case VotePageStatus.allWaitingForVote:
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
                cell.messageTextField.text = "Give vote for waiting hitchhikers"
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "driverVoteCell", for: indexPath) as! DriverVoteTableViewCell
                let trip = driverVotePageDataSource.nonVotedTrips[indexPath.row]
                let ratingImageNamesArray = driverVotePageHelper.getRatingImageArray(rating: trip.rating)
                cell.starOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
                cell.starTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
                cell.starThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
                cell.starFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
                cell.starFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
                
                cell.usernameLabel.text = trip.hitchHikerUserName
                cell.fromLabel.text = trip.from
                cell.toLabel.text = trip.to
                cell.minDepartureTimeLabel.text = trip.startTime.convertUtcToDisplay()
                cell.maxDepartureTimeLabel.text = trip.endTime.convertUtcToDisplay()
                
                cell.delegate = self
                cell.tripId = trip.id
                
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
                cell.messageTextField.text = "Default Cell"
                return cell
            }
        case VotePageStatus.waitingAndVoted:
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "driverVoteCell", for: indexPath) as! DriverVoteTableViewCell
                let trip = driverVotePageDataSource.votedTrips[indexPath.row]
                let ratingImageNamesArray = driverVotePageHelper.getRatingImageArray(rating: trip.rating)
                cell.starOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
                cell.starTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
                cell.starThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
                cell.starFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
                cell.starFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
                
                cell.usernameLabel.text = trip.hitchHikerUserName
                cell.fromLabel.text = trip.from
                cell.toLabel.text = trip.to
                cell.minDepartureTimeLabel.text = trip.startTime.convertUtcToDisplay()
                cell.maxDepartureTimeLabel.text = trip.endTime.convertUtcToDisplay()
                
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "driverVoteCell", for: indexPath) as! DriverVoteTableViewCell
                let trip = driverVotePageDataSource.nonVotedTrips[indexPath.row]
                let ratingImageNamesArray = driverVotePageHelper.getRatingImageArray(rating: trip.rating)
                cell.starOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
                cell.starTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
                cell.starThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
                cell.starFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
                cell.starFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
                
                cell.usernameLabel.text = trip.hitchHikerUserName
                cell.fromLabel.text = trip.from
                cell.toLabel.text = trip.to
                cell.minDepartureTimeLabel.text = trip.startTime.convertUtcToDisplay()
                cell.maxDepartureTimeLabel.text = trip.endTime.convertUtcToDisplay()
                
                cell.delegate = self
                cell.tripId = trip.id
                
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
                cell.messageTextField.text = "Default Cell"
                return cell
            }
        case VotePageStatus.allVoted:
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "driverVoteCell", for: indexPath) as! DriverVoteTableViewCell
                let trip = driverVotePageDataSource.votedTrips[indexPath.row]
                let ratingImageNamesArray = driverVotePageHelper.getRatingImageArray(rating: trip.rating)
                cell.starOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
                cell.starTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
                cell.starThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
                cell.starFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
                cell.starFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
                
                cell.usernameLabel.text = trip.hitchHikerUserName
                cell.fromLabel.text = trip.from
                cell.toLabel.text = trip.to
                cell.minDepartureTimeLabel.text = trip.startTime.convertUtcToDisplay()
                cell.maxDepartureTimeLabel.text = trip.endTime.convertUtcToDisplay()
                
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
                cell.messageTextField.text = "You voted all trips :))"
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
                cell.messageTextField.text = "Default Cell"
                return cell
            }
        }
    }
}


