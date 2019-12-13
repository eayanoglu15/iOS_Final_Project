//
//  HitchhikerProfileViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 9.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

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
        if let hitchhiker = hitchhikerProfileDataSource.hitchhiker {
            hitchhikerProfileHelper.getInfoArray(hitchhiker: hitchhiker)
        }
        if let username = hitchhikerProfileDataSource.hitchhiker?.username {
            title = username
        }
        infoTableView.delegate = self
        infoTableView.dataSource = self
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOutButtonTapped))
    }
    
    @objc func logOutButtonTapped() {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(false, forKey: "userLoggedIn")
        userDefaults.setValue(false, forKey: "userIsDriver")
        let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
        print("NV count: ", navigationController?.viewControllers.count)
        navigationController?.viewControllers = [rootVC]
        navigationController?.pushViewController(rootVC, animated: false)
        print("NV count: ", navigationController?.viewControllers.count)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditProfile" {
            let destinationVc = segue.destination as! HitchhikerEditProfileViewController
            destinationVc.hitchhikerEditProfileDataSource.hitchhiker = hitchhikerProfileDataSource.hitchhiker
        }
    }
}
