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
            myCompany.imageString = "noImage"
            myCompany.type = myCompany.specialization
            ApiMethods.Register(company: myCompany, TaxRegisterNumber: "1", Fax: "1")
            self.performSegue(withIdentifier: "JustRegister", sender: nil)
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
