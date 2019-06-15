//
//  ImportExportNotification.swift
//  project1STversion
//
//  Created by Apple on 6/15/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import Foundation
import UIKit
class ImportExportNotification : NSObject {
    var Image : UIImage!
    var Lable1 : String!
    var Lable2 : String!
   // var ID : Int!
    init(_ L1 : String , _ L2 : String ,  _ Img : UIImage) {
//       self.ID = id
        self.Lable1 = L1
        self.Lable2 = L2
        self.Image = Img
        
    }
}
