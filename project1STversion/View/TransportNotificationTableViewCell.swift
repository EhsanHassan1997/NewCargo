//
//  TransportNotificationTableViewCell.swift
//  project1STversion
//
//  Created by Apple on 4/14/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class TransportNotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var imExCompanyLogoImageView: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
