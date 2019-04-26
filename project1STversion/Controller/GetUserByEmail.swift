//
//  GetUserByEmail.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 3/16/19.
//  Copyright © 2019 Ehsan Hassan. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class GetUserByEmail{
    class func UderData(email : String,Comp:(_ user: User? )-> Void){
        let url = URL(string: "https://samples.openweathermap.org/data/2.5/forecast/daily?id=524901&appid=b1b15e88fa797225412429c1c50c122a1")!
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result{
                
            case .failure(let error):
                print("failure: ",error)
                break
                
            case .success(let value):
                print("success: ",value)
                break
                
            }
            
        }
    }
}

