//
//  DriverOtherProfileViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 13.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

extension DriverOtherProfileViewController : DriverOtherProfileDataSourceDelegate{
    func otherUserLoaded() {
        if let user = driverOtherProfileDataSource.otherUser {
            driverOtherProfileHelper.getInfoArray(user: user)
            let ratingImageNamesArray = driverOtherProfileHelper.getRatingImageArray(rating: user.rating)
            starOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
            starTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
            starThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
            starFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
            starFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
            ratingLabel.text = "\(user.rating) / 5"
            votesLabel.text = "\(user.voteNumber) vote"
            profileImageView.image = user.profileImage
            infoTableView.reloadData()
            removeSpinner()
        } else {
            showAlertMsg(title: "Something goes wrong", message: "Couldn't find other user")
            removeSpinner()
        }
    }
    
    func showAlertMsg(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    }
}

class DriverOtherProfileViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var starOneImageView: UIImageView!
    @IBOutlet weak var starTwoImageView: UIImageView!
    @IBOutlet weak var starThreeImageView: UIImageView!
    @IBOutlet weak var starFourImageView: UIImageView!
    @IBOutlet weak var starFiveImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var infoTableView: UITableView!
    
    var driverOtherProfileDataSource = DriverOtherProfileDataSource()
    var driverOtherProfileHelper = DriverOtherProfileHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        driverOtherProfileDataSource.delegate = self
        infoTableView.delegate = self
        infoTableView.dataSource = self
        title = driverOtherProfileDataSource.otherUsername
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showSpinner()
        driverOtherProfileDataSource.getOtherUser()
    }
}

extension DriverOtherProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return driverOtherProfileHelper.otherUserInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoTableViewCell
        let info = driverOtherProfileHelper.otherUserInfoArray[indexPath.row]
        cell.variableLabel.text = info.0
        cell.valueLabel.text = info.1
        return cell
    }
}
