//
//  SecondRegisterViewController.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 4/12/19.
//  Copyright © 2019 Ehsan Hassan. All rights reserved.
//

import UIKit
import LGButton
class SecondRegisterViewController: UIViewController {
    
    @IBOutlet weak var errorMessageLable: UILabel!
    @IBOutlet weak var TaxCardTextField: UITextField!
    @IBOutlet weak var TaxFileNumberTextField: UITextField!
    @IBOutlet weak var SpecializationTextField: UITextField!
    @IBOutlet weak var NextActionButton: LGButton!
    
    var myCompany : Company!
    override func viewDidLoad() {
//        errorMessageLable.text = myCompany.name

        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func NextAction(_ sender: LGButton) {
        let myColor = UIColor.orange
        if (TaxCardTextField.text == "" || TaxFileNumberTextField.text == "" || SpecializationTextField.text == ""){
            errorMessageLable.text = "fill empty space "
            
            if (TaxCardTextField.text == ""){
                TaxCardTextField.layer.borderWidth =  2
                TaxCardTextField.layer.cornerRadius = 7
                TaxCardTextField.layer.borderColor = myColor.cgColor
                
            }else{
                TaxCardTextField.layer.borderWidth =  0
            }
            if (TaxFileNumberTextField.text == "" ){
                TaxFileNumberTextField.layer.borderWidth =  2
                TaxFileNumberTextField.layer.cornerRadius = 7
                TaxFileNumberTextField.layer.borderColor = myColor.cgColor
                
            }else{
                TaxFileNumberTextField.layer.borderWidth =  0
                
            }
            if(SpecializationTextField.text == "" ){
                SpecializationTextField.layer.borderWidth =  2
                SpecializationTextField.layer.cornerRadius = 7
                SpecializationTextField.layer.borderColor = myColor.cgColor
                
            }else{
                SpecializationTextField.layer.borderWidth =  0
            }
        }else{
            myCompany.TaxCard = TaxCardTextField.text
            myCompany.TaxFileNumber = TaxCardTextField.text
            myCompany.specialization = SpecializationTextField.text
            if SpecializationTextField.text == "import-export"{
                ImExImage = myCompany.image
            }else if SpecializationTextField.text == "transport"{
                TrImage = myCompany.image
            }
            performSegue(withIdentifier: "ThirdRegister", sender: myCompany)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ThirdRegister"{
            let vc = segue.destination as! SetPasswordViewController
            vc.myCompany = sender as? Company
        }
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
