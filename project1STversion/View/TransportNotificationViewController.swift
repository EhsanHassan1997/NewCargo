//
//  TransportNotificationViewController.swift
//  project1STversion
//
//  Created by Apple on 4/14/19.
//

import UIKit

class TransportNotificationViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    fileprivate let cellHeight :CGFloat = 120.0
    var TranNot : [TransportNotificationClass] = []
    
    override func viewDidLoad() {
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "appLogo-1"))

        UserDefaults.standard.set(false, forKey: "AcceptedRequest")
        
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellidentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        TranNot = createNotifications()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.bool(forKey: "AcceptedRequest"){
            TranNot.append(TransportNotificationClass( 1 , "your technical offer is accepted", "Set your financial offer",UIImage(named: "ImportCompany")!))
            UserDefaults.standard.set(false, forKey: "AcceptedRequest")
            tableView.reloadData()
        }
    }
    
    func createNotifications()-> [TransportNotificationClass] {
        var Temp : [TransportNotificationClass] = []
        
        let image1 = UIImage(named: "ImportCompany")!
        let not1 = TransportNotificationClass( 1 , "YOU have request from Import-Export Company", "Company name: Tahran",image1)
        
        let not2 = TransportNotificationClass( 1 , "your technical offer is accepted", "Set your financial offer",image1)
        
        let image2 = UIImage(named: "ImAndExIgnored")!
        let not3 = TransportNotificationClass( 2 ,"YOU have been accepted for Transporting ", "Company name Losy",image2 )
        
        let image3 = UIImage(named: "imEx")!
        let not4 = TransportNotificationClass( 3 , "YOUr offer has been ignored by  ", "Company name Losy",image3 )
        
        let image4 = UIImage(named: "Application")!
        let not5 = TransportNotificationClass( 4 , "YOUr driver Current Status ", "Cargo follow up",image4 )
        
        Temp.append(not1)
//        Temp.append(not2)
        Temp.append(not3)
        Temp.append(not4)
        Temp.append(not5)
        
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
extension TransportNotificationViewController  :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TranNot.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Notification = TranNot[indexPath.row]
        let cell : TransportNotificationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TransportNotificationCell", for: indexPath) as! TransportNotificationTableViewCell
        cell.SetTransportNotificationTableViewCell(TransNotif: Notification)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  indexPath.row == 0{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "RequestDetailTechnical") as! ConfirmationRequestViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 4{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "RequestDetail") as! ShowRequestViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 1{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AssignTruckToDriver") as! AssignTruckViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 2{
            self.navigationController?.popViewController(animated: true)
        }
        else if indexPath.row == 3{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DriverCurrentLocation") as! MapPathViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension TransportNotificationViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
