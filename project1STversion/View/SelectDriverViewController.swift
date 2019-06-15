//
//  SelectDriverViewController.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 6/15/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class SelectDriverViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate let cellHeight :CGFloat = 120.0
    var Driver : [assignDriver] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellidentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        Driver = createDrivers()
        // Do any additional setup after loading the view.
    }
    
    
    func createDrivers()-> [assignDriver] {
        var Temp : [assignDriver] = []
        
        let image1 = UIImage(named: "profileimage")!
        let not1 = assignDriver(image1, "ahmed", "ahmed@Cargo.com", "01212385611")
        
        
        Temp.append(not1)
        
        
        return Temp
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

extension SelectDriverViewController  :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Driver.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Notification = Driver[indexPath.row]
        let cell : SelectdriverTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TruckCell", for: indexPath) as! SelectdriverTableViewCell
        cell.SetDriverTableViewCell(DriverChoosed: Notification)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(Driver[indexPath.row], forKey: "selectedDriver")
        self.navigationController?.popViewController(animated: true)
        // var Tran : [TransportNotificationClass] = []
        //        if  indexPath.row == 0{
        //            print("hi")
        //            let vc = self.storyboard?.instantiateViewController(withIdentifier: "RequestDetail") as! ShowRequestViewController
        //            self.navigationController?.pushViewController(vc, animated: true)
        //        }
        //        else if indexPath.row == 1{
        //            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AssignTruckToDriver") as! assignTruckToDriverViewController
        //            self.navigationController?.pushViewController(vc, animated: true)
        //        }
        //        else if indexPath.row == 2{
        //            let vc = self.storyboard?.instantiateViewController(withIdentifier: "home") as! TransportHomeViewController
        //            self.navigationController?.pushViewController(vc, animated: true)
        //        }
        //        else if indexPath.row == 3{
        //            print("tOOoooooooooooooz")
        //            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DriverCurrentLocation") as! MapPathViewController
        //            self.navigationController?.pushViewController(vc, animated: true)
        //        }
    }
}

extension SelectDriverViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
