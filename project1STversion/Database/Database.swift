//
//  Database.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 4/11/19.
//  Copyright © 2019 Ehsan Hassan. All rights reserved.
//

import Foundation
import SQLite
class Database {
    static let shared : Database = Database()
    var DB : Connection?
    init() {
//        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
//        do{
//            DB = try Connection ("path/to/db.sqlite3")
//            
//        }
//        catch{
//            DB = nil
//            print("unable to open database")
//        }
        
        do {
            try DB?.run(company.create { t in
                t.column(companyID, primaryKey: true)
                t.column(userName)
                t.column(companyAddress)
                t.column(companyTaxFileNumber,unique: true)
                t.column(companyTaxCard,unique: true)
                t.column(companyPhone,unique: true)
                t.column(companySpecalization)
                t.column(companyFax,unique: true)
                t.column(companyType)
                t.foreignKey(userID, references: users, userID)
            })
            
            
            try DB?.run(import_exportCompany.create { t in
                t.column(im_Ex_ID, primaryKey: true)
                t.column(type)
                t.foreignKey(companyID, references: company  , companyID)
                
            })
            
            try DB?.run(transportCompany.create { t in
                t.column(trabsport_ID, primaryKey: true)
                t.foreignKey(companyID, references: company  , companyID)
                
            })
            
            
        } catch  {
            print("error\nerror esmo omer el so8er")
        }
//        let insert = users.insert(userID <- 1)
    }
        
        // CREATE TABLE "users" (
        //     "id" INTEGER PRIMARY KEY NOT NULL,
        //     "name" TEXT,
        //     "email" TEXT NOT NULL UNIQUE
        // )
        // MARK:- Creating Tables
        // MARK:- User Table
    let users = Table("users")
    let userID = Expression<Int64>("id")
    let userName = Expression<String?>("name")
    let userEmail = Expression<String>("email")
    let userPassword = Expression<String>("password")
    let userImage = Expression<String>("image")
    let userRate = Expression<Double>("rate")
    let userType = Expression<String>("type")
    
    // MARK:- Company Table
    
    let company = Table("company")
    let companyID = Expression<Int64>("id")
    let companyAddress = Expression<String>("address")
    let companyTaxFileNumber = Expression<String>("tax_file_number")
    let companyTaxCard = Expression<String>("tax_card")
    let companyPhone = Expression<String>("phone")
    let companySpecalization = Expression<String>("specalization")
    let companyFax = Expression<String>("fax")
    let companyType = Expression<String>("type")
    
    
    // MARK:- Import_export Company Table
    let import_exportCompany = Table("import_export_company")
    let im_Ex_ID = Expression<Int64>("id")
    let type = Expression<String>("type")//Import Or export Or both
    
    
    // MARK:- Transport Company Table
    let transportCompany = Table("transport_company")
    let trabsport_ID = Expression<Int64>("id")
    
    
    
    
    
}
        
    
    
    

