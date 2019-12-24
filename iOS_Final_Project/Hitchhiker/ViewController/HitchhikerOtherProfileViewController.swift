//
//  HitchhikerOtherProfileViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 9.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

extension HitchhikerOtherProfileViewController : HitchhikerOtherProfileDataSourceDelegate{
    func otherUserLoaded() {
        if let user = hitchhikerOtherProfileDataSource.otherUser {
            hitchhikerOtherProfileHelper.getInfoArray(user: user)
            let ratingImageNamesArray = hitchhikerOtherProfileHelper.getRatingImageArray(rating: user.rating)
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
        removeSpinner()
    }
    
    func showAlertMsg(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    }
}

class HitchhikerOtherProfileViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var starOneImageView: UIImageView!
    @IBOutlet weak var starTwoImageView: UIImageView!
    @IBOutlet weak var starThreeImageView: UIImageView!
    @IBOutlet weak var starFourImageView: UIImageView!
    @IBOutlet weak var starFiveImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var infoTableView: UITableView!
    
    var hitchhikerOtherProfileHelper = HitchhikerOtherProfileHelper()
    var hitchhikerOtherProfileDataSource = HitchhikerOtherProfileDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hitchhikerOtherProfileDataSource.delegate = self
        infoTableView.delegate = self
        infoTableView.dataSource = self
        title = hitchhikerOtherProfileDataSource.otherUsername
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showSpinner()
        hitchhikerOtherProfileDataSource.getOtherUser()
    }
}

extension HitchhikerOtherProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hitchhikerOtherProfileHelper.otherUserInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoTableViewCell
        let info = hitchhikerOtherProfileHelper.otherUserInfoArray[indexPath.row]
        cell.variableLabel.text = info.0
        cell.valueLabel.text = info.1
        return cell
    }
}
