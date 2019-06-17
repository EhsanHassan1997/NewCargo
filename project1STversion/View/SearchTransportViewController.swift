//
//  SearchTransportViewController.swift
//  project1STversion
//
//  Created by Apple on 6/15/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class SearchTransportViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var SearchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var Offers : [offer] = []
    
    fileprivate let cellHeight :CGFloat = 120.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellidentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        Offers = createOffers()
        // Do any additional setup after loading the view.
    }
    
    func createOffers()-> [offer] {
        var Temp : [offer] = []
        
        let image1 = UIImage(named: "Transport1")!
        let not1 = offer( "Price: 20,000 EGP" , "The Egyption Company for Maritime Transport", "Rate: 4.0",image1)
        
        let image2 = UIImage(named: "Transport2")!
        let not2 = offer( "Price: 30,000 EGP" , "MovEx Transportation and International Shipping", "Rate: 4.5",image1)
        
        let image3 = UIImage(named: "Transport3")!
        let not3 = offer( "Price: 15,000 EGP" , "Arab Maritime Petroleum Transport", "Rate: 5.0",image1)
        
        let image4 = UIImage(named: "Transport4")!
        let not4 = offer( "Price: 20,500 EGP" , "Rockit Transport Services and Logistics Solutions", "Rate: 3.9",image1)
        
        Temp.append(not1)
        Temp.append(not2)
        Temp.append(not3)
        Temp.append(not4)
        
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

extension SearchTransportViewController  :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Offers.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Notification = Offers[indexPath.row]
        let cell : searchTransportTableViewCell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! searchTransportTableViewCell
        cell.SetOfferTableViewCell(Offer: Notification)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             if  indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3{
            print("hi")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "payment") as! paymentViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                
        }
        }

    }


extension SearchTransportViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
