//
//  TransportHomeViewController.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 3/16/19.
//  Copyright © 2019 Ehsan Hassan. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class TransportHomeViewController: UIViewController , CLLocationManagerDelegate {
    @IBOutlet weak var menuButon: UIButton!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var mapView: GMSMapView!
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var hideMenuButton: UIButton!
    @IBOutlet weak var sideMenuView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        sideMenuView.isHidden = true
        hideMenuButton.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "appLogo-1"))
        
        locationManager.delegate = self 
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func NotificationAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TransportNotification") as! TransportNotificationViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("notification button is clicked")
    }
    @IBAction func MenuAction(_ sender: UIButton) {
        
        sideMenuView.isHidden = false
        hideMenuButton.isHidden = false
        
        
    }
    
    @IBAction func HideMenuAction(_ sender: UIButton) {
        
        sideMenuView.isHidden = true
        hideMenuButton.isHidden = true
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let latitude = locations.last?.coordinate.latitude
        let longitude = locations.last?.coordinate.longitude
//        let center = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
        let camera = GMSCameraPosition.camera(withLatitude: latitude!, longitude: longitude!, zoom: 17)
        //        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        // Creates a marker in the center of the map.
//                let currentLocation_Marker = GMSMarker()
//                currentLocation_Marker.position = center
//                currentLocation_Marker.title = "My Current Location"
//                currentLocation_Marker.snippet = "I am here now"
//                currentLocation_Marker.map = mapView
        
        
        
//        let currentLocation = GMSMarker()
//        currentLocation.position = destination
//        currentLocation.title = "My Current Location"
//        currentLocation.snippet = "I am here now"
//        currentLocation.map = myMapView
        
        
        self.mapView.camera = camera
        
        self.mapView.isMyLocationEnabled = true
        
//        fetchRoute(from: center, to: destination)
        //        APImethod.myMap(from: center, to: destination) { (points) in
        //            let point : String! = points[0]!
        //            self.drawPath(from: point)
        //        }
        locationManager.stopUpdatingLocation()
        
    }

    
    //    private func

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
