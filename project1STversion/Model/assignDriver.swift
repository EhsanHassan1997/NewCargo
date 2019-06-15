//
//  assignDriver.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 6/15/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import Foundation
import UIKit
class assignDriver {
    //var select : UIButton!
    var DriverImage : UIImage!
    var driverName : String!
    var driverEmail : String!
    var driverPhone : String!
    
    init(_ i : UIImage , _ d : String ,  _ t : String , _ p : String) {
        self.DriverImage = i
        self.driverName = d
        self.driverEmail = t
        self.driverPhone = p
    }
    
}
