//
//  MessageTableViewCell.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 14.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    @IBOutlet weak var messageTextField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
