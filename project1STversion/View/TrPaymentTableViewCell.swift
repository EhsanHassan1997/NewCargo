//
//  TrPaymentTableViewCell.swift
//  project1STversion
//
//  Created by Apple on 6/18/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class TrPaymentTableViewCell: UITableViewCell {

    @IBOutlet weak var numberOfCard: UILabel!
    @IBOutlet weak var ccvCard: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    func SetpaymentTableViewCell(Payment : payment){
        cardImage.image = Payment.Image
        numberOfCard.text = Payment.number
        ccvCard.text = Payment.cvv
    }

}
