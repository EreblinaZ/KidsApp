//
//  CustomTableViewCell.swift
//  KidsApplication
//
//  Created by macos on 7/9/20.
//  Copyright © 2020 macos. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var colorImage: UIImageView!
    @IBOutlet weak var colorLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
