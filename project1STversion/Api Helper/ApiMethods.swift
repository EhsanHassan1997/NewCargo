//
//  ApiMethods.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 4/23/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class ApiMethods {
    
    class func LoginUser(Email : String, Password : String, Comp:@escaping (_ token:String)->Void){
        let Url = URL(string: UserLoginUrl)!
        var prametars = [
            "email" : Email ,
            "password" : Password,
            
            
        ]
        Alamofire.request(Url, method: .post, parameters: prametars, encoding: JSONEncoding.default, headers: nil).responseJSON { (request) in
            switch (request.result){
            case .success(let value):
                let json = JSON(value)
                print(json)
                if let token = json["token"].string{
                    Comp(token)
                    return
                }
            case .failure(let error):
                print("error: ",error)
                break
            }
        }
    }
}
