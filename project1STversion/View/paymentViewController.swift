//
//  paymentViewController.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 6/15/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

//import UIKit
//
//class paymentViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    @IBAction func AddPaymentMethod(_ sender: UIButton){
//    }
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}



import UIKit

class paymentViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    fileprivate let cellHeight :CGFloat = 120.0
    var paymentcell : [payment] = []

    override func viewDidLoad() {

        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero

        tableView.dataSource = self
        tableView.delegate = self

        paymentcell = createNotifications()


    }


    func createNotifications()-> [payment] {
        var Temp : [payment] = []

        let image1 = UIImage(named: "ImportCompany")!
        let not1 = payment( "YOU have request from Import-Export Company", "Company name Tahran",image1)

        let image2 = UIImage(named: "ImAndExIgnored")!
        let not2 = payment( "YOU have been accepted for Transporting ", "Company name Losy",image2 )

        let image3 = UIImage(named: "imEx")!
        let not3 = payment( "YOUr offer has been ignored by  ", "Company name Losy",image3 )

        let image4 = UIImage(named: "Application")!
        let not4 = payment("YOUr driver Current Status ", "Cargo follow up",image4 )

        Temp.append(not1)
        Temp.append(not2)
        Temp.append(not3)
        Temp.append(not4)

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
extension paymentViewController  :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentcell.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celldata = paymentcell[indexPath.row]
        let cell : paymentViewController = tableView.dequeueReusableCell(withIdentifier: "paymentCell", for: indexPath) as! paymentTableViewCell
        cell.SetpaymentTableViewCell(Payment : celldata )
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  indexPath.row == 0{
            print("hi")
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

extension paymentViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}

