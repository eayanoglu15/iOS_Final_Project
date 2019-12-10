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
    @IBOutlet weak var starOneImageView: UIImageView!
    @IBOutlet weak var starTwoImageView: UIImageView!
    @IBOutlet weak var starThreeImageView: UIImageView!
    @IBOutlet weak var starFourImageView: UIImageView!
    @IBOutlet weak var starFiveImageView: UIImageView!
    @IBOutlet weak var infoTableView: UITableView!
    
    var hitchhikerProfileHelper = HitchhikerProfileHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hitchhikerProfileHelper.getInfoArray()
        if let username = hitchhikerProfileHelper.hitchhiker?.username {
            title = username
        }
        infoTableView.delegate = self
        infoTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditProfile" {
            let destinationVc = segue.destination as! HitchhikerEditProfileViewController
            destinationVc.hitchhikerEditProfileHelper.hitchhiker = hitchhikerProfileHelper.hitchhiker
        }
    }
}
