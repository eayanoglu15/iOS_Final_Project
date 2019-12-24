//
//  HitchhikerProfileViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 9.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

extension HitchhikerProfileViewController: HitchhikerProfileDataSourceDelegate {
    func userLoaded() {
        if let user = hitchhikerProfileDataSource.hitchhiker {
            hitchhikerProfileHelper.getInfoArray(hitchhiker: user)
            let ratingImageNamesArray = hitchhikerProfileHelper.getRatingImageArray(rating: user.rating)
            starOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
            starTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
            starThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
            starFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
            starFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
            profileImageView.image = hitchhikerProfileDataSource.hitchhiker?.profileImage
            ratingLabel.text = "\(user.rating) / 5"
            votesLabel.text = "\(user.voteNumber) vote"
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

class HitchhikerProfileViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var starOneImageView: UIImageView!
    @IBOutlet weak var starTwoImageView: UIImageView!
    @IBOutlet weak var starThreeImageView: UIImageView!
    @IBOutlet weak var starFourImageView: UIImageView!
    @IBOutlet weak var starFiveImageView: UIImageView!
    @IBOutlet weak var infoTableView: UITableView!
    
    var hitchhikerProfileHelper = HitchhikerProfileHelper()
    var hitchhikerProfileDataSource = HitchhikerProfileDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTableView.delegate = self
        infoTableView.dataSource = self
        hitchhikerProfileDataSource.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOutButtonTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        if let username = userDefaults.string(forKey: "username") {
            title = username
            self.showSpinner()
            hitchhikerProfileDataSource.getUser(username: username)
        }
    }
    
    @objc func logOutButtonTapped() {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(false, forKey: "userLoggedIn")
        userDefaults.setValue(false, forKey: "userIsDriver")
        userDefaults.removeObject(forKey: "username")
        let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
        navigationController?.viewControllers = [rootVC]
        navigationController?.pushViewController(rootVC, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditProfile" {
            let destinationVc = segue.destination as! HitchhikerEditProfileViewController
            destinationVc.hitchhikerEditProfileDataSource.hitchhiker = hitchhikerProfileDataSource.hitchhiker
        }
    }
}

extension HitchhikerProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hitchhikerProfileHelper.hitchhikerInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoTableViewCell
        let info = hitchhikerProfileHelper.hitchhikerInfoArray[indexPath.row]
        cell.variableLabel.text = info.0
        cell.valueLabel.text = info.1
        return cell
    }
}
