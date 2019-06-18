//
//  TransportNotificationViewController.swift
//  project1STversion
//
//  Created by Apple on 4/14/19.
//

import UIKit
import LGButton
class AssignTruckViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    //fileprivate let cellidentifier =  "TransportNotificaioncell"
    fileprivate let cellHeight :CGFloat = 120.0
    var Truck : [assignTruck] = []
    var removedDriver : [Int] = []

    override func viewDidLoad() {
        
        UserDefaults.standard.set(-1,forKey: "selectedTruck")
        UserDefaults.standard.set("",forKey: "selectedDriver")
        UserDefaults.standard.set(-1, forKey: "NselectedDriver")
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellidentifier)
        tableView.dataSource = self
        tableView.delegate = self
        Truck = createTrucks()
        print("did load")
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("will Appear")
        if !(UserDefaults.standard.integer(forKey: "selectedTruck") == -1 ){
            print("y",UserDefaults.standard.string(forKey: "selectedDriver"))
            Truck[UserDefaults.standard.integer(forKey: "selectedTruck")].drivername = "Name : " + UserDefaults.standard.string(forKey: "selectedDriver")!
            Truck[UserDefaults.standard.integer(forKey: "selectedTruck")].driverEmail = "Email : " + UserDefaults.standard.string(forKey: "selectedDriverEmail")!
            removedDriver.append(UserDefaults.standard.integer(forKey: "NselectedDriver"))
            tableView.reloadData()
        }
    }
    
    func createTrucks()-> [assignTruck] {
        var Temp : [assignTruck] = []

        let not1 = assignTruck("", "Type: Dry Van", "Platform Number: 952 ع م ق ","")

        let not2 = assignTruck("", "Type: Dry Van", "Platform Number: 511 ع م ر ","")
        
        let not3 = assignTruck("", "Type: Dry Van ", "Platform Number: 415 ق م ق ","")
        
        let not4 = assignTruck("", "Type: Tanker", "Platform Number: 335 ع ش ق ","")
        
        Temp.append(not1)

        Temp.append(not2)
        
        Temp.append(not3)
        
        Temp.append(not4)

        return Temp
    }
    
    @IBAction func DoneAction(_ sender: LGButton) {
        if !(UserDefaults.standard.string(forKey: "selectedDriver") == ""){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TrPay") as! TrPaymentViewController
            self.navigationController?.pushViewController(vc, animated: true)
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
extension AssignTruckViewController  :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Truck.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("hi")
        let Notification = Truck[indexPath.row]
        let cell : TruckTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TruckCell", for: indexPath) as! TruckTableViewCell
        cell.SetTruckTableViewCell(TrucKChoosed: Notification)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(indexPath.row, forKey: "selectedTruck")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AssigningDriver") as! SelectDriverViewController
        vc.removed = removedDriver
        self.navigationController?.pushViewController(vc, animated: true)

    }
}

extension AssignTruckViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
