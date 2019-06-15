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
        
        tableView.dataSource = self
        tableView.delegate = self
        
        Driver = createDrivers()
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
        let cell : SelectdriverTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DriverCell", for: indexPath) as! SelectdriverTableViewCell
        cell.SetDriverTableViewCell(DriverChoosed: Notification)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(Driver[indexPath.row].driverName, forKey: "selectedDriver")
        self.navigationController?.popViewController(animated: true)
        
    }
}

extension SelectDriverViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
