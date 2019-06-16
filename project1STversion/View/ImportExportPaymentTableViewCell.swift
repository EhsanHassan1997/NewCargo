//
//  ImportExportPaymentTableViewCell.swift
//  project1STversion
//
//  Created by Apple on 6/16/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class ImportExportPaymentTableViewCell: UITableViewCell {
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var ccvCard: UILabel!
    @IBOutlet weak var numberOfCard: UILabel!
    
    func SetpaymentTableViewCell(Payment : payment){
        cardImage.image = Payment.Image
        numberOfCard.text = Payment.number
        ccvCard.text = Payment.cvv
    }
    
}
