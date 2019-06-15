//
//  SelectdriverTableViewCell.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 6/15/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class SelectdriverTableViewCell: UITableViewCell {

    @IBOutlet weak var driverImage: UIImageView!
    
    @IBOutlet weak var driverName: UILabel!
    
    @IBOutlet weak var driverEmail: UILabel!
    
    @IBOutlet weak var driverPhone: UILabel!
    
    func SetDriverTableViewCell(DriverChoosed : assignDriver){
        driverName.text = DriverChoosed.driverName
        driverEmail.text = DriverChoosed.driverEmail
        driverPhone.text = DriverChoosed.driverPhone
        driverImage.image = DriverChoosed.DriverImage
    }

}
