//
//  TransportNotificationClass.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 6/12/19.
//  
//

import Foundation
import UIKit
class TransportNotificationClass : NSObject {
    var firstLable : String!
    var secondLable : String!
    var Image : UIImage!
    init( _ L1 : String , _ L2 : String ,  _ Img : UIImage) {
        self.firstLable = L1
        self.secondLable = L2
        self.Image = Img
    }
    
}
