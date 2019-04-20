//
//  TransportNotificationViewController.swift
//  project1STversion
//
//  Created by Apple on 4/14/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class TransportNotificationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TransportNotificationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TransportNotificationCell", for: indexPath) as! TransportNotificationTableViewCell
        cell.firstLabel.text = "you have request from"
        cell.secondLabel.text = "Ehsan Company for Import & Export"
        cell.imExCompanyLogoImageView.layer.cornerRadius = cell.imExCompanyLogoImageView.bounds.width / 2
        cell.imExCompanyLogoImageView.clipsToBounds = true
        return cell
    }
    
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "appLogo-1"))

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        // Do any additional setup after loading the view.
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
