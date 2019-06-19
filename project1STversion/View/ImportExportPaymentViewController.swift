//
//  ImportExportPaymentViewController.swift
//  project1STversion
//
//  Created by Apple on 6/16/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class ImportExportPaymentViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let cellHeight :CGFloat = 120.0
    var paymentcell : [payment] = []
    
    override func viewDidLoad() {
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "appLogo-1"))
        
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        
        tableView.dataSource = self
        tableView.delegate = self
        
        paymentcell = createNotifications()
        
        
    }
    
    
    func createNotifications()-> [payment] {
        var Temp : [payment] = []
        
        let image1 = UIImage(named: "masterCard")!
        let not1 = payment( "999 8909 6758 9708 ", "452 ",image1)
        
        let image2 = UIImage(named: "PayPal")!
        let not2 = payment( "6758 4376 4010 6758 ", "452",image2 )
        
        let image3 = UIImage(named: "visacard")!
        let not3 = payment( " 6758 4376 4010 0305 ", "2023",image3 )
        
        
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
extension ImportExportPaymentViewController  :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentcell.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celldata = paymentcell[indexPath.row]
        let cell : ImportExportPaymentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ImExpaymentCell", for: indexPath) as! ImportExportPaymentTableViewCell
        cell.SetpaymentTableViewCell(Payment : celldata )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ImportExportPaymentViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
