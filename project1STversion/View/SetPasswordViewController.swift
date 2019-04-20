//
//  SetPasswordViewController.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 4/12/19.
//  Copyright © 2019 Ehsan Hassan. All rights reserved.
//

import UIKit
import LGButton
import SQLite

class SetPasswordViewController: UIViewController {
    @IBOutlet weak var errorMessageLable: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var doneButton: LGButton!
    
    
    var myCompany : Company!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func DoneAction(_ sender: LGButton) {
        if(passwordTextField.text == confirmPasswordTextField.text){
            myCompany.password = passwordTextField.text
            var myDatabase = Database()
            
            let users = Table("users")
            let userID = Expression<Int64>("id")
            let userName = Expression<String?>("name")
            let userEmail = Expression<String>("email")
            let userPassword = Expression<String>("password")
            let userImage = Expression<String>("image")
            let userRate = Expression<Double>("rate")
            let userType = Expression<String>("type")
            
            
            
            do{
                myDatabase.DB = try Connection ("path/to/db.sqlite3")
                
                try myDatabase.DB?.run(users.create { t in
                    t.column(userID, primaryKey: true)
                    t.column(userName)
                    t.column(userEmail, unique: true)
                    t.column(userPassword,unique: true)
                    t.column(userImage)
                    t.column(userRate)
                    t.column(userType)
                })
                let insert = users.insert(userName <- myCompany.name, userEmail <- myCompany.email, userPassword <- myCompany.password, userImage <- "kjbdjs" , userRate <- 5, userType <- "Company")
                let rww = try myDatabase.DB?.run(insert)
                let alice = users.filter(userID == rww!)
                print("hya de",alice[userName])
            }
            catch let error{
                print(error.localizedDescription)
            }
            
        }else{
            errorMessageLable.text = "please enter matched password "
        }
        
    }
    
    @IBAction func M3AFENACTION(_ sender: UIButton) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
