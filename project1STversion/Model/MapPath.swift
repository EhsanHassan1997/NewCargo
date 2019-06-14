//
//  MapPath.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 6/15/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import Foundation
class MapPath {
    
    var lat : Double?
    var lon : Double?
    var angle : Double?
    
    init() {}
    init(lat : Double?,lon : Double?,angle : Double?) {
        self.lat = lat
        self.lon = lon
        self.angle = angle
    }
}
