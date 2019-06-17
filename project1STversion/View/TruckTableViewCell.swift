//
//  TruckTableViewCell.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 6/15/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class TruckTableViewCell: UITableViewCell {
    @IBOutlet weak var truckType: UILabel!
    @IBOutlet weak var platformNumber: UILabel!
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var driverEmail: UILabel!
    
        func SetTruckTableViewCell(TrucKChoosed : assignTruck){
             driverName.text = TrucKChoosed.drivername
             truckType.text = TrucKChoosed.trucktype
             platformNumber.text = TrucKChoosed.platformnumber
            driverEmail.text = TrucKChoosed.driverEmail
    }
}
