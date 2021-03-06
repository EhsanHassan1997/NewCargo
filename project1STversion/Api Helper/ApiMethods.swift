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
import Foundation
import GooglePlaces
import GoogleMaps
class ApiMethods {
        
    // MARK: Register
    class func Register (company : Company, TaxRegisterNumber : String, Fax : String){
        let url = URL(string: UserRegisterUrl)!
        let parameters = [
            "email" : company.email,
            "name" : company.name,
            "password" : company.password,
            "type" : company.type,
            "tax_card" : company.TaxCard,
            "tax_file_number" : company.TaxFileNumber,
            "tax_register_number" : TaxRegisterNumber,
            "fax" : Fax,
            "image" : company.imageString,
            "address" : company.Address,
            "cargo_specialization" : company.specialization,
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch (response.result){
            case .success(let value):
                print("Value: ",value)
                break
            case .failure(let error):
                print("Error: ",error)
                break
            }
        }
    }
    
    // MARK: user login
    class func LoginUser(Email : String, Password : String, Comp:@escaping (_ token:String,_ type : String,_ userID : Int,_ userName: String)->Void){
        let Url = URL(string: UserLoginUrl)!
        let prametars = [
            "email" : Email ,
            "password" : Password,
        ]
        Alamofire.request(Url, method: .post, parameters: prametars, encoding: JSONEncoding.default, headers: nil).responseJSON { (request) in
            switch (request.result){
            case .success(let value):
                let json = JSON(value)
                print(json)
                if let token = json["token"].string{
                    if let user = json["user"].dictionary{
                        if let type = user["type"]?.string{
                            if let UserID = user["id"]?.int{
                                if let Username = user["name"]?.string{
                                    Comp(token,type,UserID,Username)
                                    return
                                }
                            }
                        }
                    }
                }
            case .failure(let error):
                print("error: ",error)
                break
            }
        }
    }
    
    // MARK: Get User
    class func GetUser(UserId : Int, Usser :@escaping(_ user : User)->Void ){
        var user = User()
        
        let Url = URL(string: UserDetailsUrl + String(UserId))!
        let headers = [
            "Authorization" : "Bearer " + GetUserToken(),
        ]
        Alamofire.request(Url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                
                 let json =  JSON(value)
                 if let userName = json["name"].string{
                    if let userEmail = json["email"].string{
                        user.name = userName
                        user.email = userEmail
                        Usser(user)
                        return
                    }
                    
                 }
                 
                break
            case .failure(let Error):
                break
            }
        }
    }
    
    // MARK: Add Driver
    class func AddDriver(Name : String, Email : String, Password : String, Type : String, Image : String, MedicalReport : String, Licence : Int, BirthDay : String, LicenceType : String, UserId : Int){
        let Url = URL(string: DriverUrl)!
        let parameters = [
            "name" : Name,
            "email" : Email,
            "password" : Password,
            "type" : Type,
            "image" : Image,
            "Medical_Report" : MedicalReport,
            "licence" : Licence,
            "birth_date" : BirthDay,
            "licence_type" : LicenceType,
            "user_id" : UserId,
            ] as [String : Any]
        let headers = [
            "Authorization" : "Bearer " + GetUserToken(),
            ]
        Alamofire.request(Url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                break
            case .failure(let Error):
                break
            }
        }
    }
    
    // MARK: Add Truck
    class func AddTruck(PlatFormNumber : String, MotorPower : Int, MotorNumber : Int, Gas : String, NumberOfCylinder : Int, Chassis : String, Type : String, Color : String, Load : Int, UserId : Int){
        let Url = URL(string: TruckUrl)!
        let parameters = [
            "Plat_form_Number" : PlatFormNumber,
            "Motor_Power" : MotorPower,
            "Motor_Number" : MotorNumber,
            "Gas" : Gas,
            "No_Of_slender" : NumberOfCylinder,
            "Chassis" : Chassis,
            "Type" : Type,
            "Color" : Color,
            "load" : Load,
            "user_id" : UserId,
            ] as [String : Any]
        let headers = [
            "Authorization" : "Bearer " + GetUserToken(),
            ]
        Alamofire.request(Url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                break
            case .failure(let Error):
                break
            }
        }
    }
    
    // MARK: Driven By
    class func DrivenBy(DriverId : Int, TruckId : Int, UserId : Int){
        let Url = URL(string: DrivenByUrl)!
        let parameters = [
            "driver_id" : DriverId,
            "truck_id" : TruckId,
            "user_id" : UserId,
            ]
        let headers = [
            "Authorization" : "Bearer " + GetUserToken(),
            ]
        Alamofire.request(Url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                break
            case .failure(let Error):
                break
            }
        }
    }
    
    // MARK: Get Request
    class func TransportRequestDetails(requestId : Int, RequestDetaile:@escaping (_ requestDetaile: Request)->Void){
        var requestDetaile = Request()
        
        var header = [
            "Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEwOSwiaXNzIjoiaHR0cDovLzUyLjU5LjIzMS41OC9hcGkvdXNlci9sb2dpbiIsImlhdCI6MTU2MDAwOTk5MCwiZXhwIjo3NTYwMDA5OTkwLCJuYmYiOjE1NjAwMDk5OTAsImp0aSI6ImRyTlZOck1JZnpRTWIzMEEifQ.LMCYb8LF_rYfaFfaz9FTXHUjPmXaq0hq8Cvmo3Vvi5Y" ,
        ]
        let Url = URL(string: RequestDetailsUrl + String(requestId))!
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
                                                            if let companyImportExport = json["company_import_export"].int{
                                                                if let volume = json["Total_Volume"].string{
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
                                                                    requestDetaile.comIm_Ex = String(companyImportExport)
                                                                    requestDetaile .Volume = Double(volume)
                                                                    RequestDetaile(requestDetaile)
                                                                    return
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
                    }
                }
              break
            case .failure(let error):
                print("error: ",error)
                break
                
            }
        }
    }
    
    
    // MARK: Create Offer
    class func CreateOffer(RequestId : Int, Price :Double){
        let Url = URL(string: OfferUrl + String(RequestId))!
        let parameters = [
            "price" : Price,
            ]
        let headers = [
            "Authorization" : "Bearer " + GetUserToken(),
            ]
        Alamofire.request(Url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let price = json["price"].double{
                    return
                }
                
                break
            case .failure(let Error):
                break
            }
        }
    }
    
    // MARK: Add Contract Details
    class func AddContractDetails(DriverId : Int, TruckId : Int, ContractId : Int, Road : Int){
        let Url = URL(string: ContractDetailsUrl)!
        let parameters = [
            "driver_id" : DriverId,
            "truck_id" : TruckId,
            "contract_id" : ContractId,
            "road" : Road,
            ]
        let headers = [
            "Authorization" : "Bearer " + GetUserToken(),
            ]
        Alamofire.request(Url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                break
            case .failure(let Error):
                break
            }
        }
    }
    
    //MARK: Current Location Driver
    class func myMap(from source: CLLocationCoordinate2D ,  to destination: CLLocationCoordinate2D , comp:@escaping (_ polyLineString:[String?])->Void){
        
        let url = URL(string: "http://maps.googleapis.com/maps/api/directions/json?origin=\(source.latitude),\(source.longitude)&destination=\(destination.latitude),\(destination.longitude)&sensor=false&mode=driving")!
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result{
                
            case .failure(let error):
                print("Error: ",error)
                break
                
            case .success(let value):
                var Points :[String?] = []
                let json = JSON(value)
                if let Routes = json["routes"].array{
                    for route in Routes{
                        if let legs = route["legs"].array{
                            for leg in legs{
                                if let overview_polyline = leg["overview_polyline"].dictionary{
                                    if let points = overview_polyline["points"]?.string{
                                        Points.append(points)
                                    }
                                }
                            }
                        }
                    }
                    comp(Points)
                }
                return
            }
        }
    }
    
    // MARK: Create Request
    class func CreateRequest(request:Request, companyID:Int,comp:@escaping (_ requestID:Int) -> Void){
        print("token",GetUserToken(),"/nCompanyID: ",companyID)
        print("1")
        let Url = URL(string: RequestUrl)!
        print("2")
        let parameters : [String : Any] = [
            "Cargo_type" : request.cargoType,
            "Pick_Up_Location" : request.PickUp,
            "Deliver_To" : request.Destination,
            "quantity" : request.Quantity,
            "Item_Weight" : request.Weight,
            "Item_Width" : request.Width,
            "Item_length" : request.Length,
            "No_of_Shipment" : "1",
            "Total_Weight" : request.Weight * Double(request.Quantity),
            "start_date" : request.StartDate,
            "finish_date" : request.EndDate,
            "Item_Height" : request.Hieght,
            "company_import_export" : companyID,
            ]
        print("3")
        let headers = [
            "Authorization" : "Bearer " + GetUserToken(),
            ]
        print("4")
        Alamofire.request(Url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseString { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON:- ",json)
                comp(0)
                return
            case .failure(let Error):
                print("error",Error)
                comp(1)
                return
            }
        }
        print("5")
    }
    
    // MARK: Get All Requests
    class func GetAllRequest(){
         let Url = URL(string: AllRequestUrl)
        
    }
    
    // MARK: Get Offers
    class func GetOffers(){
        
    }
    
    // MARK: Create Contract
    class func CreateContract(){
        
    }
    
    // MARK: Get Contract
    class func GetContract(){
        
    }
    

}
