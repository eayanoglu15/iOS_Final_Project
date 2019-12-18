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
        if let otherUser = driverOtherProfileDataSource.otherUser {
            driverOtherProfileHelper.getInfoArray(user: otherUser)
        }
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
        }
        infoTableView.reloadData()
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
        driverOtherProfileDataSource.getOtherUser()
        title = driverOtherProfileDataSource.otherUsername
        // Do any additional setup after loading the view.
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
