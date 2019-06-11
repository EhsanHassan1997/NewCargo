//
//  TransportProfileViewController.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 6/9/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class TransportProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var RateLabel: UILabel!
    
    @IBOutlet weak var CangeEmailButton: UIButton!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var EmailLable: UILabel!
    
    @IBOutlet weak var CompanyNameTextField: UITextField!
    @IBOutlet weak var ChangeCompanyNameButton: UIButton!
    
    @IBOutlet weak var PhoneButton: UIButton!
    @IBOutlet weak var PhoneTextField: UITextField!
    @IBOutlet weak var PhoneLable: UILabel!
    
    @IBOutlet weak var AddressTextField: UITextField!
    @IBOutlet weak var AddressButton: UIButton!
    @IBOutlet weak var AddressLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func ChangeImageAction(_ sender: UIButton) {
    }
    
    @IBAction func ChangeCompanyName(_ sender: Any) {
    }
    
    @IBAction func changeEmailAction(_ sender: UIButton) {
                if (CangeEmailButton.isEnabled ==  true){
                    EmailTextField.isHidden = false
                    EmailTextField.isUserInteractionEnabled = true
        
                }else if (CangeEmailButton.isEnabled ==  false){
                    EmailTextField.isHidden = true
                    EmailTextField.isUserInteractionEnabled = false
                }
        
            }
            @IBAction func PhoneAction(_ sender: UIButton) {
            }
            @IBAction func AddressAction(_ sender: UIButton) {
            }
            @IBAction func DriverAction(_ sender: UIButton) {
            }
    
            @IBAction func TruckAction(_ sender: UIButton) {
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

