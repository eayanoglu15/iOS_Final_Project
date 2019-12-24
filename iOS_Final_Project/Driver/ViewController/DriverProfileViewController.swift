//
//  DriverProfileViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 12.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

extension DriverProfileViewController: DriverProfileDataSourceDelegate {
    func userLoaded() {
        if let user = driverProfileDataSource.driver {
            driverProfileHelper.getInfoArray(user: user)
            let ratingImageNamesArray = driverProfileHelper.getRatingImageArray(rating: user.rating)
            starOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
            starTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
            starThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
            starFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
            starFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
            profileImageView.image = driverProfileDataSource.driver?.profileImage
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

class DriverProfileViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var starOneImageView: UIImageView!
    @IBOutlet weak var starTwoImageView: UIImageView!
    @IBOutlet weak var starThreeImageView: UIImageView!
    @IBOutlet weak var starFourImageView: UIImageView!
    @IBOutlet weak var starFiveImageView: UIImageView!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var infoTableView: UITableView!
    
    var driverProfileDataSource = DriverProfileDataSource()
    var driverProfileHelper = DriverProfileHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTableView.delegate = self
        infoTableView.dataSource = self
        driverProfileDataSource.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOutButtonTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        if let username = userDefaults.string(forKey: "username") {
            title = username
            self.showSpinner()
            driverProfileDataSource.getUser(username: username)
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
        if segue.identifier == "toEditDriverProfile" {
            let destinationVc = segue.destination as! DriverEditProfileViewController
            destinationVc.driverEditProfileDataSource.driver = driverProfileDataSource.driver
        }
    }
}

extension DriverProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return driverProfileHelper.userInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoTableViewCell
        let info = driverProfileHelper.userInfoArray[indexPath.row]
        cell.variableLabel.text = info.0
        cell.valueLabel.text = info.1
        return cell
    }
}


