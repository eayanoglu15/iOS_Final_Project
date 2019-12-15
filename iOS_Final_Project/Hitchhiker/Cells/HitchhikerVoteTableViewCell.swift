//
//  HitchhikerVoteTableViewCell.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 16.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

class HitchhikerVoteTableViewCell: UITableViewCell {
    @IBOutlet weak var starOneImageView: UIImageView!
    @IBOutlet weak var starTwoImageView: UIImageView!
    @IBOutlet weak var starThreeImageView: UIImageView!
    @IBOutlet weak var starFourImageView: UIImageView!
    @IBOutlet weak var starFiveImageView: UIImageView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var carModelLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var minDepartureTimeLabel: UILabel!
    @IBOutlet weak var maxDepartureTimeLabel: UILabel!
    
    @IBOutlet weak var voteStarOneImageView: UIImageView!
    @IBOutlet weak var voteStarTwoImageView: UIImageView!
    @IBOutlet weak var voteStarThreeImageView: UIImageView!
    @IBOutlet weak var voteStarFourImageView: UIImageView!
    @IBOutlet weak var voteStarFiveImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
