//
//  ImExTableViewCell.swift
//  project1STversion
//
//  Created by Apple on 6/15/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class ImExTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    func SetImExTableViewCellTableViewCell(ImExNotif : ImportExportNotification){
        logoImage.image = ImExNotif.Image
        label2.text =  ImExNotif.Lable1
        label2.text = ImExNotif.Lable2
    }
    
    
}
