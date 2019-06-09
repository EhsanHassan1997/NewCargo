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
    class func TransportRequestDetails(requestId : Int, Request:@escaping (_ requestDetaile: RequestDetaile)->Void){
        var requestDetaile = RequestDetaile()
        
        let url = RequestDetailsUrl + "/" + String(requestId)
        
        var header = [
            "Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEwOSwiaXNzIjoiaHR0cDovLzUyLjU5LjIzMS41OC9hcGkvdXNlci9sb2dpbiIsImlhdCI6MTU2MDAwOTk5MCwiZXhwIjo3NTYwMDA5OTkwLCJuYmYiOjE1NjAwMDk5OTAsImp0aSI6ImRyTlZOck1JZnpRTWIzMEEifQ.LMCYb8LF_rYfaFfaz9FTXHUjPmXaq0hq8Cvmo3Vvi5Y" ,
        ]
        
        let Url = URL(string: url)!
        Alamofire.request(Url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON{ (request) in
            switch (request.result){
            case .success(let value):
                let json = JSON(value)
                print("JSON Response:- ",json)
                if let CargoType = json["Cargo_type"].string{
                    print("Cargo Type:-\n",CargoType)
                    if let PickUpLocation = json ["Pick_Up_Location"].string{
                        if let Destination = json["Deliver_To"].string{
                                if let Quantity = json["quantity"].int{
                                    if let ItemWeight = json["Item_Weight"].double{
                                        if let ItemWidth = json["Item_Width"].double{
                                            if let ItemHeight = json["Item_Height"].double{
                                                if let ItemLength = json["Item_length"].double{
                                                    if let startDate = json["start_date"].string{
                                                        if let endDate = json["finish_date"].string{
                                                            if let companyImportExport = json["company_import_export"].string{
                                                                requestDetaile.cargoType = CargoType
                                                                requestDetaile.PickUp = PickUpLocation
                                                                requestDetaile.Destination = Destination
                                                                requestDetaile.Quantity = Quantity
                                                                requestDetaile.Weight = ItemWeight
                                                                requestDetaile.Width = ItemWidth
                                                                requestDetaile.Hieght = ItemHeight
                                                                requestDetaile.Length = ItemLength
                                                                requestDetaile.StartDate = startDate
                                                                requestDetaile.EndDate = endDate
                                                                requestDetaile.comIm_Ex = companyImportExport
                                                                Request(requestDetaile)
                                                                return
//                                                                if let volume = json["Total_Volume"].double{
//                                                                    requestDetaile.cargoType = CargoType
//                                                                    requestDetaile.PickUp = PickUpLocation
//                                                                    requestDetaile.Destination = Destination
//                                                                    requestDetaile.Quantity = Quantity
//                                                                    requestDetaile.Width = ItemWeight
//                                                                    requestDetaile.Hieght = ItemHeight
//                                                                    requestDetaile.Weight = ItemWeight
//                                                                    requestDetaile.Length = ItemLength
//                                                                    requestDetaile.StartDate = startDate
//                                                                    requestDetaile.EndDate = endDate
//                                                                    requestDetaile.comIm_Ex = companyImportExport
//                                                                    Request(
//                                                                        //requestDetaile,
//                                                                        CargoType)
//                                                                    return
                                                                }
//
//                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                     }
                                }
                            }
                        }
                    }
                }
              break
            case .failure(let error):
                print("error: ",error)
                break
                
        }
        
    }
}
}
