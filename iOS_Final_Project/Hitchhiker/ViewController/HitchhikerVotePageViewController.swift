//
//  HitchhikerVotePageViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 15.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

// table view extensions
// get username from user defaults
extension HitchhikerVotePageViewController: HitchhikerVotePageDataSourceDelegate {
    func reloadTableView() {
        voteTableView.reloadData()
    }
    
    func showAlertMsg(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func loadVotePageData() {
        self.removeSpinner()
        voteTableView.reloadData()
    }
}

extension HitchhikerVotePageViewController: HitchhikerVoteTableViewCellDelegate {
    func giveVote(tripId: Int, vote: Int) {
        hitchhikerVotePageDataSource.giveVoteForTrip(tripId: tripId, vote: vote)
    }
}

class HitchhikerVotePageViewController: UIViewController {
    @IBOutlet weak var voteTableView: UITableView!
    
    var hitchhikerVotePageDataSource = HitchhikerVotePageDataSource()
    var hitchhikerVotePageHelper = HitchhikerVotePageHelper()
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Votes"
        voteTableView.dataSource = self
        hitchhikerVotePageDataSource.delegate = self
        refreshControl.addTarget(self, action:  #selector(reloadData), for: .valueChanged)
        voteTableView.refreshControl = refreshControl
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let user = hitchhikerVotePageDataSource.hitchhiker {
            self.showSpinner()
            hitchhikerVotePageDataSource.getVotePageData(username: user.username)
        }
    }
    
    @objc func reloadData() {
        if let user = hitchhikerVotePageDataSource.hitchhiker {
            hitchhikerVotePageDataSource.getVotePageData(username: user.username)
        }
        voteTableView.refreshControl?.endRefreshing()
        voteTableView.reloadData()
    }
}

extension HitchhikerVotePageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        switch hitchhikerVotePageDataSource.status {
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
        switch hitchhikerVotePageDataSource.status {
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
        switch hitchhikerVotePageDataSource.status {
        case VotePageStatus.noTrip:
            return 1
        case VotePageStatus.noRequest:
            return 1
        case VotePageStatus.allWaitingForVote:
            switch section {
            case 0:
                return 1
            case 1:
                return hitchhikerVotePageDataSource.nonVotedTrips.count
            default: return 0
            }
        case VotePageStatus.waitingAndVoted:
            switch section {
            case 0:
                return hitchhikerVotePageDataSource.votedTrips.count
            case 1:
                return hitchhikerVotePageDataSource.nonVotedTrips.count
            default: return 0
            }
        case VotePageStatus.allVoted:
            switch section {
            case 0:
                return hitchhikerVotePageDataSource.votedTrips.count
            case 1:
                return 1
            default: return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch hitchhikerVotePageDataSource.status {
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "hitchhikerVoteCell", for: indexPath) as! HitchhikerVoteTableViewCell
                let trip = hitchhikerVotePageDataSource.nonVotedTrips[indexPath.row]
                cell.setRatingStars(rating: trip.rating)
                cell.usernameLabel.text = trip.driverUserName
                cell.fromLabel.text = trip.from
                cell.toLabel.text = trip.to
                cell.minDepartureTimeLabel.text = trip.startTime.convertUtcToDisplay()
                cell.maxDepartureTimeLabel.text = trip.endTime.convertUtcToDisplay()
                let dataDecoded : Data = Data(base64Encoded: trip.image, options: .ignoreUnknownCharacters)!
                cell.profileImageView.image = UIImage(data: dataDecoded)!
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "hitchhikerVoteCell", for: indexPath) as! HitchhikerVoteTableViewCell
                let trip = hitchhikerVotePageDataSource.votedTrips[indexPath.row]
                cell.setRatingStars(rating: trip.rating)
                cell.usernameLabel.text = trip.driverUserName
                cell.fromLabel.text = trip.from
                cell.toLabel.text = trip.to
                cell.minDepartureTimeLabel.text = trip.startTime.convertUtcToDisplay()
                cell.maxDepartureTimeLabel.text = trip.endTime.convertUtcToDisplay()
                let dataDecoded : Data = Data(base64Encoded: trip.image, options: .ignoreUnknownCharacters)!
                cell.profileImageView.image = UIImage(data: dataDecoded)!
                if let vote = trip.voteGiven {
                        cell.setVoteStars(vote: vote)
                }
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "hitchhikerVoteCell", for: indexPath) as! HitchhikerVoteTableViewCell
                let trip = hitchhikerVotePageDataSource.nonVotedTrips[indexPath.row]
                cell.setRatingStars(rating: trip.rating)
                cell.usernameLabel.text = trip.driverUserName
                cell.fromLabel.text = trip.from
                cell.toLabel.text = trip.to
                cell.minDepartureTimeLabel.text = trip.startTime.convertUtcToDisplay()
                cell.maxDepartureTimeLabel.text = trip.endTime.convertUtcToDisplay()
                let dataDecoded : Data = Data(base64Encoded: trip.image, options: .ignoreUnknownCharacters)!
                cell.profileImageView.image = UIImage(data: dataDecoded)!
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "hitchhikerVoteCell", for: indexPath) as! HitchhikerVoteTableViewCell
                let trip = hitchhikerVotePageDataSource.votedTrips[indexPath.row]
                cell.setRatingStars(rating: trip.rating)
                cell.usernameLabel.text = trip.driverUserName
                cell.fromLabel.text = trip.from
                cell.toLabel.text = trip.to
                cell.minDepartureTimeLabel.text = trip.startTime.convertUtcToDisplay()
                cell.maxDepartureTimeLabel.text = trip.endTime.convertUtcToDisplay()
                let dataDecoded : Data = Data(base64Encoded: trip.image, options: .ignoreUnknownCharacters)!
                cell.profileImageView.image = UIImage(data: dataDecoded)!
                if let vote = trip.voteGiven {
                        cell.setVoteStars(vote: vote)
                }
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



