//
//  TransportNotificationViewController.swift
//  project1STversion
//
//  Created by Apple on 4/14/19.
//

import UIKit

class AssignTruckViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    //fileprivate let cellidentifier =  "TransportNotificaioncell"
    fileprivate let cellHeight :CGFloat = 120.0
    var Truck : [assignTruck] = []
    
    override func viewDidLoad() {
        
        UserDefaults.standard.set(-1,forKey: "selectedTruck")
        UserDefaults.standard.set("",forKey: "selectedDriver")
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellidentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        Truck = createTrucks()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewWillAppear(animated)
        if !(UserDefaults.standard.integer(forKey: "selectedTruck") == -1 ){
            Truck[UserDefaults.standard.integer(forKey: "selectedTruck")].drivername = UserDefaults.standard.string(forKey: "selectedDriver")
            }
    }
    
    func createTrucks()-> [assignTruck] {
        var Temp : [assignTruck] = []

//        let image1 = UIImage(named: "profileimage")!
        let not1 = assignTruck("i", "", "545 ع م ق ")

        Temp.append(not1)


        return Temp
    }
    @IBAction func MenuAction(_ sender: UIButton) {
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
extension AssignTruckViewController  :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Truck.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Notification = Truck[indexPath.row]
        let cell : TruckTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TruckCell", for: indexPath) as! TruckTableViewCell
        cell.SetTruckTableViewCell(TrucKChoosed: Notification)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(indexPath.row, forKey: "selectedTruck")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AssigningDriver") as! SelectDriverViewController
        self.navigationController?.pushViewController(vc, animated: true)
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

extension AssignTruckViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
