//
//  HitchhikerHomeViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 5.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

extension HitchhikerHomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hitchhikerFeedDataSource.feedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HitchhikerHomeCell", for: indexPath) as! HitchhikerHomeTableViewCell
        let feed = hitchhikerFeedDataSource.feedArray[indexPath.row]
        let ratingImageNamesArray = hitchhikerHomeHelper.getRatingImageArray(rating: feed.rating)
        
        cell.starOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
        cell.starTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
        cell.starThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
        cell.starFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
        cell.starFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
        
        cell.usernameLabel.text = feed.username
        cell.carModelLabel.text = feed.carModel
        cell.availableSeatsLabel.text = "\(feed.availableSeats)"
        cell.fromLabel.text = feed.from
        cell.toLabel.text = feed.to
        cell.departureTimeLabel.text = feed.departureTime
        if let profileImage = feed.profileImage {
            cell.profileImageView.image = profileImage
        }
        return cell
    }
}

class HitchhikerHomeViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var hitchhikerHomeTableView: UITableView!
    
    
    var hitchhiker: User?
    let hitchhikerFeedDataSource = HitchhikerFeedDataSource()
    let hitchhikerHomeHelper = HitchhikerHomeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        username.text = hitchhiker?.username
        hitchhikerHomeTableView.dataSource = self
        hitchhikerHomeTableView.delegate = self
        
        title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(profileButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "My Requests", style: .plain, target: self, action: #selector(requestsButtonTapped))
    }
    
    @objc func profileButtonTapped() {
        performSegue(withIdentifier: "toHitchhikerProfile", sender: nil)
    }
    
    @objc func requestsButtonTapped() {
        performSegue(withIdentifier: "toHitchhikerRequests", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHitchhikerProfile" {
            let destinationVc = segue.destination as! HitchhikerProfileViewController
            destinationVc.hitchhikerProfileHelper.hitchhiker = hitchhiker
        }
        
    }
    
}
