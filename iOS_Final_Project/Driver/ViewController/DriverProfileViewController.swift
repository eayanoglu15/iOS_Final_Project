//
//  DriverProfileViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 12.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOutButtonTapped))
        
        if let driver = driverProfileDataSource.driver {
            driverProfileHelper.getInfoArray(driver: driver)
            title = driver.username
            let ratingImageNamesArray = driverProfileHelper.getRatingImageArray(rating: driver.rating)
            starOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
            starTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
            starThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
            starFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
            starFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
            ratingLabel.text = "\(driver.rating) / 5"
            votesLabel.text = "\(driver.voteNumber) vote"
        }
    }
    
    @objc func logOutButtonTapped() {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(false, forKey: "userLoggedIn")
        userDefaults.setValue(false, forKey: "userIsDriver")
        userDefaults.removeObject(forKey: "username")
        let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
        print("NV count: ", navigationController?.viewControllers.count)
        navigationController?.viewControllers = [rootVC]
        navigationController?.pushViewController(rootVC, animated: false)
        print("NV count: ", navigationController?.viewControllers.count)
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
        return driverProfileHelper.driverInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoTableViewCell
        let info = driverProfileHelper.driverInfoArray[indexPath.row]
        cell.variableLabel.text = info.0
        cell.valueLabel.text = info.1
        return cell
    }
}


