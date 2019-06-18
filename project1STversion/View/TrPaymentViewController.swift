//
//  TrPaymentViewController.swift
//  project1STversion
//
//  Created by Apple on 6/18/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class TrPaymentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let cellHeight :CGFloat = 120.0
    
    var paymentcell : [payment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        
        tableView.dataSource = self
        tableView.delegate = self
        
        paymentcell = createNotifications()    }
    
    @IBAction func AddAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "addNewPaymentMethod") as! addNewPaymentViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func createNotifications()-> [payment] {
        var Temp : [payment] = []
        
        let image1 = UIImage(named: "masterCard")!
        let not1 = payment( "4916 4376 6394 9708 ", "452 ",image1)
        
        let image2 = UIImage(named: "PayPal")!
        let not2 = payment( "9001 4376 4010 4010 ", "452",image2 )
        
        let image3 = UIImage(named: "visacard")!
        let not3 = payment( "5506 9001 4010 0305 ", "2023",image3 )
        
        
        Temp.append(not1)
        Temp.append(not2)
        Temp.append(not3)
        
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

extension TrPaymentViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentcell.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celldata = paymentcell[indexPath.row]
        let cell : TrPaymentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TrPaymentCell", for: indexPath) as! TrPaymentTableViewCell
        cell.SetpaymentTableViewCell(Payment : celldata )
        return cell
    }
    
}
extension TrPaymentViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
