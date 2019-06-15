//
//  payment.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 6/15/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import Foundation
import Foundation
import UIKit
class payment : NSObject {
    var number : String!
    var cvv : String!
    var Image : UIImage!
    init( _ p : String , _ c : String ,  _ Img : UIImage) {
        self.number = p
        self.cvv = c
        self.Image = Img
    }
    
}
