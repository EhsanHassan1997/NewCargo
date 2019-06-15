//
//  searchTransportTableViewCell.swift
//  project1STversion
//
//  Created by Apple on 6/15/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class searchTransportTableViewCell: UITableViewCell {
    func SetTruckTableViewCell(Offer : offer){
        driverName.text = Offer.Rate
        truckType.text = Offer.Price
        platformNumber.text = Offer.Name
        LogoImage.image = Offer.Image
    }
}
