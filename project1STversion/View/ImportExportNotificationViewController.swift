//
//  ImportExportNotificationViewController.swift
//  project1STversion
//
//  Created by Apple on 6/5/19.
//  Copyright © 2019 ehsan hassan. All rights reserved.
//



import UIKit

class ImportExportNotificationViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    fileprivate let cellHeight :CGFloat = 120.0
    var imExNot : [ImportExportNotification] = []

    override func viewDidLoad() {

        self.navigationItem.titleView = UIImageView(image: UIImage(named: "appLogo-1"))

        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero

        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellidentifier)
        tableView.dataSource = self
        tableView.delegate = self

        imExNot = createNotifications()


    }


    func createNotifications()-> [ImportExportNotification] {
        var Temp : [ImportExportNotification] = []

        let image1 = UIImage(named: "Application")!
        let not1 = ImportExportNotification(  "your transporter has been choosen ", " pay 10% of the total price",image1)

//        let image2 = UIImage(named: "Application")!
        let not2 = ImportExportNotification( "View your cargo ", "current location",image1 )

        let not3 = ImportExportNotification( "Shipment status", "Shipment has been arrived",image1 )


        Temp.append(not1)
        Temp.append(not2)
        Temp.append(not3)
       

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
extension ImportExportNotificationViewController  :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imExNot.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Notification = imExNot[indexPath.row]
        let cell : ImExTableViewCell = tableView.dequeueReusableCell(withIdentifier: "imExNotification", for: indexPath) as! ImExTableViewCell
        cell.SetImExTableViewCellTableViewCell(ImExNotif: Notification)
//        let cell : UITableViewCell
//        cell = UITableViewCell()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  indexPath.row == 0{
            //print("hi")
            //to be updater ya omer
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ImportExportPayment") as! ImportExportPaymentViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 1 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DriverCurrentLocation") as! MapPathViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 2 {
            UserDefaults.standard.set(true, forKey: "Feedback")
            self.navigationController?.popViewController(animated: true)
        }
       
    }
}

extension ImportExportNotificationViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
