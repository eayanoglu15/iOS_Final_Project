//
//  HitchhikerTripRequestsViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 10.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

extension HitchhikerTripRequestsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hitchhikerTripRequestsDataSource.tripRequestArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripRequestCell", for: indexPath) as! HitchhikerTripRequestTableViewCell
        let trip = hitchhikerTripRequestsDataSource.tripRequestArray[indexPath.row]
        let ratingImageNamesArray = hitchhikerTripRequestsHelper.getRatingImageArray(rating: trip.rating)
        
        cell.starOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
        cell.starTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
        cell.starThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
        cell.starFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
        cell.starFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
        
        cell.usernameLabel.text = trip.username
        cell.carModelLabel.text = trip.carModel
        cell.statusLabel.text = trip.status
        cell.fromLabel.text = trip.from
        cell.toLabel.text = trip.to
        cell.departureTimeLabel.text = trip.departureTime
        if let profileImage = trip.profileImage {
            cell.profileImageView.image = profileImage
        }
        return cell
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
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
