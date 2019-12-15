//
//  HitchhikerVotePageViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 15.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

// table view extensions
// get username from user defaults

class HitchhikerVotePageViewController: UIViewController {
    @IBOutlet weak var voteTableView: UITableView!
    
    var hitchhikerVotePageDataSource = HitchhikerVotePageDataSource()
    var hitchhikerVotePageHelper = HitchhikerVotePageHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Votes"
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
