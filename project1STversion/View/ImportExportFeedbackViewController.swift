//
//  ImportExportFeedbackViewController.swift
//  project1STversion
//
//  Created by Apple on 6/18/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class ImportExportFeedbackViewController: UIViewController {

    @IBOutlet weak var CheckCargoStatusView: UIView!
    
    @IBOutlet weak var RateView: UIView!
    
    @IBOutlet weak var YesButton: UIButton!
    
    @IBOutlet weak var NoButton: UIButton!
    
    @IBOutlet weak var FirstStarImage: UIImageView!
    
    @IBOutlet weak var SecondStarImage: UIImageView!
    
    @IBOutlet weak var ThirdStarImage: UIImageView!
    
    @IBOutlet weak var ForthStarImage: UIImageView!
    
    @IBOutlet weak var FifthStarImage: UIImageView!
    
    @IBOutlet weak var DoneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        RateView.layer.cornerRadius = 20
        CheckCargoStatusView.layer.cornerRadius = 20
        YesButton.layer.cornerRadius = 20
        NoButton.layer.cornerRadius = 20
        
        DoneButton.layer.cornerRadius = 20
        
        RateView.transform = CGAffineTransform(scaleX: 0, y: 0)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func YesAction(_ sender: UIButton) {
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
            self.CheckCargoStatusView.transform = CGAffineTransform(scaleX: 0, y: 0)
        }) { (succ) in
            
        }
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
            self.RateView.transform = .identity
        }) { (succ) in
            
        }
        
    }
    
    @IBAction func NoAction(_ sender: UIButton) {
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
            self.CheckCargoStatusView.transform = CGAffineTransform(scaleX: 0, y: 0)
        }) { (succ) in
            
        }
        
        UIView.animate(withDuration: 2, delay: 2, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
            self.RateView.transform = .identity
        }) { (succ) in
            
        }
    }
    
    @IBAction func FirstStarAction(_ sender: UIButton) {
        FirstStarImage.image = UIImage(named: "star")
        SecondStarImage.image = UIImage(named: "emptyStar")
        ThirdStarImage.image = UIImage(named: "emptyStar")
        ForthStarImage.image = UIImage(named: "emptyStar")
        FifthStarImage.image = UIImage(named: "emptyStar")
    }
    
    @IBAction func SecondStarAction(_ sender: UIButton) {
        FirstStarImage.image = UIImage(named: "star")
        SecondStarImage.image = UIImage(named: "star")
        ThirdStarImage.image = UIImage(named: "emptyStar")
        ForthStarImage.image = UIImage(named: "emptyStar")
        FifthStarImage.image = UIImage(named: "emptyStar")
    }
    
    @IBAction func ThirdStarAction(_ sender: UIButton) {
        FirstStarImage.image = UIImage(named: "star")
        SecondStarImage.image = UIImage(named: "star")
        ThirdStarImage.image = UIImage(named: "star")
        ForthStarImage.image = UIImage(named: "emptyStar")
        FifthStarImage.image = UIImage(named: "emptyStar")
    }
    
    @IBAction func ForthStarAction(_ sender: UIButton) {
        FirstStarImage.image = UIImage(named: "star")
        SecondStarImage.image = UIImage(named: "star")
        ThirdStarImage.image = UIImage(named: "star")
        ForthStarImage.image = UIImage(named: "star")
        FifthStarImage.image = UIImage(named: "emptyStar")
    }
    
    @IBAction func FifthStarAction(_ sender: UIButton) {
        FirstStarImage.image = UIImage(named: "star")
        SecondStarImage.image = UIImage(named: "star")
        ThirdStarImage.image = UIImage(named: "star")
        ForthStarImage.image = UIImage(named: "star")
        FifthStarImage.image = UIImage(named: "star")
    }
    
    @IBAction func DoneAction(_ sender: UIButton) {
        self.view.removeFromSuperview()
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
