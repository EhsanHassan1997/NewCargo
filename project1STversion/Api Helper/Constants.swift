//
//  Constants.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 4/23/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import Foundation

let ServerUrl = "http://3.19.58.55:5060/"

let MainUrl = ServerUrl + "api/"

// MARK: Register
let UserRegisterUrl = MainUrl + "user/register"

// MARK: user login
let UserLoginUrl = MainUrl + "user/login"

// MARK: Get User
let UserDetailsUrl = MainUrl + "user/show/"

// MARK: Add Driver
let DriverUrl = MainUrl + "driver/store"

// MARK: Add Truck
let TruckUrl = MainUrl + "truck/store"

// MARK: Driven By
let DrivenByUrl = MainUrl + "drivenby/store"

// MARK: Get Request
let RequestDetailsUrl = MainUrl + "req/reqs/"

// MARK: Create Offer
let OfferUrl = MainUrl + "offer/store/"

// MARK: Add Contract Details
let ContractDetailsUrl = MainUrl + "Contract_details/store"

// MARK: Create Request
let RequestUrl = MainUrl + "request/store"

// MARK: Get All Requests
let AllRequestUrl = "imex/allrequests"

// MARK: Get Offers

// MARK: Create Contract
let ContractUrl = MainUrl + "Contract/store/"

// MARK: Get Contract
let ShowContractUrl = MainUrl + "imex/shipment/"

func GetUserToken()->String{
    return UserDefaults.standard.string(forKey: "token")!
}


var CompanyInTechnical : [Company] = []
