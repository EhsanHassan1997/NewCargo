//
//  searchTransportTableViewCell.swift
//  project1STversion
//
//  Created by Apple on 6/15/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class searchTransportTableViewCell: UITableViewCell {
    @IBOutlet weak var LogoImage: UIImageView!
    @IBOutlet weak var CompanyName: UILabel!
    @IBOutlet weak var CompanyRate: UILabel!
    @IBOutlet weak var Price: UILabel!
    func SetOfferTableViewCell(Offer : offer){
        CompanyRate.text = Offer.Rate
        Price.text = Offer.Price
        CompanyName.text = Offer.Name
        LogoImage.image = Offer.Image
    }
}
