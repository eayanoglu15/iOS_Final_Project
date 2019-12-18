//
//  HitchhikerVoteTableViewCell.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 16.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

protocol HitchhikerVoteTableViewCellDelegate: AnyObject {
    func giveVote(tripId: Int, vote: Int)
}

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
    
    var tripId: Int?
    
    weak var delegate: HitchhikerVoteTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(oneStarTapped))
        voteStarOneImageView.addGestureRecognizer(tap1)
        voteStarOneImageView.isUserInteractionEnabled = true
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(twoStarTapped))
        voteStarTwoImageView.addGestureRecognizer(tap2)
        voteStarTwoImageView.isUserInteractionEnabled = true
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(threeStarTapped))
        voteStarThreeImageView.addGestureRecognizer(tap3)
        voteStarThreeImageView.isUserInteractionEnabled = true
        
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(fourStarTapped))
        voteStarFourImageView.addGestureRecognizer(tap4)
        voteStarFourImageView.isUserInteractionEnabled = true
        
        let tap5 = UITapGestureRecognizer(target: self, action: #selector(fiveStarTapped))
        voteStarFiveImageView.addGestureRecognizer(tap5)
        voteStarFiveImageView.isUserInteractionEnabled = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @objc func oneStarTapped()
    {
        print("oneStarTapped")
        if let id = tripId {
            self.delegate?.giveVote(tripId: id, vote: 1)
        }
        voteStarOneImageView.isUserInteractionEnabled = false
        voteStarTwoImageView.isUserInteractionEnabled = false
        voteStarThreeImageView.isUserInteractionEnabled = false
        voteStarFourImageView.isUserInteractionEnabled = false
        voteStarFiveImageView.isUserInteractionEnabled = false
        
        let ratingImageNamesArray = getRatingImageArray(rating: 1.0)
        voteStarOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
        voteStarTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
        voteStarThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
        voteStarFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
        voteStarFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
    }
    
    @objc func twoStarTapped()
    {
        print("twoStarTapped")
        if let id = tripId {
            self.delegate?.giveVote(tripId: id, vote: 2)
        }
        voteStarOneImageView.isUserInteractionEnabled = false
        voteStarTwoImageView.isUserInteractionEnabled = false
        voteStarThreeImageView.isUserInteractionEnabled = false
        voteStarFourImageView.isUserInteractionEnabled = false
        voteStarFiveImageView.isUserInteractionEnabled = false
        
        let ratingImageNamesArray = getRatingImageArray(rating: 2.0)
        voteStarOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
        voteStarTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
        voteStarThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
        voteStarFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
        voteStarFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
    }
    
    @objc func threeStarTapped()
    {
        print("threeStarTapped")
        if let id = tripId {
            self.delegate?.giveVote(tripId: id, vote: 3)
        }
        voteStarOneImageView.isUserInteractionEnabled = false
        voteStarTwoImageView.isUserInteractionEnabled = false
        voteStarThreeImageView.isUserInteractionEnabled = false
        voteStarFourImageView.isUserInteractionEnabled = false
        voteStarFiveImageView.isUserInteractionEnabled = false
        
        let ratingImageNamesArray = getRatingImageArray(rating: 3.0)
        voteStarOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
        voteStarTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
        voteStarThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
        voteStarFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
        voteStarFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
    }
    
    @objc func fourStarTapped()
    {
        print("fourStarTapped")
        if let id = tripId {
            self.delegate?.giveVote(tripId: id, vote: 4)
        }
        voteStarOneImageView.isUserInteractionEnabled = false
        voteStarTwoImageView.isUserInteractionEnabled = false
        voteStarThreeImageView.isUserInteractionEnabled = false
        voteStarFourImageView.isUserInteractionEnabled = false
        voteStarFiveImageView.isUserInteractionEnabled = false
        
        let ratingImageNamesArray = getRatingImageArray(rating: 4.0)
        voteStarOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
        voteStarTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
        voteStarThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
        voteStarFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
        voteStarFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
    }
    
    @objc func fiveStarTapped()
    {
        print("fiveStarTapped")
        if let id = tripId {
            self.delegate?.giveVote(tripId: id, vote: 5)
        }
        voteStarOneImageView.isUserInteractionEnabled = false
        voteStarTwoImageView.isUserInteractionEnabled = false
        voteStarThreeImageView.isUserInteractionEnabled = false
        voteStarFourImageView.isUserInteractionEnabled = false
        voteStarFiveImageView.isUserInteractionEnabled = false
        
        let ratingImageNamesArray = getRatingImageArray(rating: 5.0)
        voteStarOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
        voteStarTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
        voteStarThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
        voteStarFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
        voteStarFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
    }
    
    private enum Constant {
        static let starNum = 5
        static let filledStarName = "star.fill"
        static let halfFilledStarName = "star.lefthalf.fill"
        static let emptyStarName = "star"
    }
    
    func getRatingImageArray(rating: Double) -> [String] {
        var ratingImageArray = [String]()
        let numberOfFilledStars = Int(rating)
        for _ in 0..<numberOfFilledStars {
            ratingImageArray.append(Constant.filledStarName)
        }
        if rating - Double(numberOfFilledStars) >= 0.5 {
            ratingImageArray.append(Constant.halfFilledStarName)
        }
        let remaining = Constant.starNum - ratingImageArray.count
        for _ in 0..<remaining {
            ratingImageArray.append(Constant.emptyStarName)
        }
        return ratingImageArray
    }
    
    func setVoteStars(vote: Int) {
        let votingImageNamesArray = getRatingImageArray(rating: Double(vote))
        voteStarOneImageView.image = UIImage(systemName: votingImageNamesArray[0])
        voteStarTwoImageView.image = UIImage(systemName: votingImageNamesArray[1])
        voteStarThreeImageView.image = UIImage(systemName: votingImageNamesArray[2])
        voteStarFourImageView.image = UIImage(systemName: votingImageNamesArray[3])
        voteStarFiveImageView.image = UIImage(systemName: votingImageNamesArray[4])
    }
    
    func setRatingStars(rating: Double) {
        let ratingImageNamesArray = getRatingImageArray(rating: rating)
        starOneImageView.image = UIImage(systemName: ratingImageNamesArray[0])
        starTwoImageView.image = UIImage(systemName: ratingImageNamesArray[1])
        starThreeImageView.image = UIImage(systemName: ratingImageNamesArray[2])
        starFourImageView.image = UIImage(systemName: ratingImageNamesArray[3])
        starFiveImageView.image = UIImage(systemName: ratingImageNamesArray[4])
    }
}
