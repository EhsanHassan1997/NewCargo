//
//  ImportExportNotificationViewController.swift
//  project1STversion
//
//  Created by Apple on 6/5/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

//import UIKit
//
//class ImportExportNotificationViewController: UIViewController {
//
//    @IBOutlet weak var tableView: UITableView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//
//}

import UIKit

class ImportExportNotificationViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    fileprivate let cellHeight :CGFloat = 120.0
    var imExNot : [ImportExportNotification] = []

    override func viewDidLoad() {

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
        let not1 = ImportExportNotification(  "your request has been accepted by ", " companies select one to be your Tranporter",image1)

        let image2 = UIImage(named: "Application")!
        let not2 = ImportExportNotification( "View your request  ", "to make sure that your data is accepted to you",image2 )

        


        Temp.append(not1)
        Temp.append(not2)
       

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

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  indexPath.row == 0{
            //print("hi")
            //to be updater ya omer
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "RequestDetail") as! ShowRequestViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 1 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Import-ExportHome") as! ImportExportHomeViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
       
    }
}

extension ImportExportNotificationViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
//
