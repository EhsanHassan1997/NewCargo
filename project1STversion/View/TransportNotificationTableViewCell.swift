//
//  TransportNotificationTableViewCell.swift
//  project1STversion
//
//  Created by Apple on 4/14/19.
//

import UIKit

class TransportNotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var imExCompanyLogoImageView: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    func SetTransportNotificationTableViewCell(TransNotif : TransportNotificationClass){
        imExCompanyLogoImageView.image = TransNotif.Image
        firstLabel.text =  TransNotif.firstLable
        secondLabel.text = TransNotif.secondLable
    }
}
