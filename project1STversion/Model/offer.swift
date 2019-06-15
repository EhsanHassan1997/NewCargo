//
//  offer.swift
//  project1STversion
//
//  Created by Apple on 6/15/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import Foundation
import UIKit
class offer {
    var Price : String!
    var Name : String!
    var Rate : String!
    var Image : UIImage!
    init( _ p : String ,_ n : String , _ r : String ,  _ Img : UIImage) {
        self.Price = p
        self.Name = n
        self.Rate = r
        self.Image = Img
    }
}
