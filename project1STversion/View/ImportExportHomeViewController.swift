//
//  ImportExportHomeViewController.swift
//  project1STversion
//
//  Created by Apple on 6/5/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class ImportExportHomeViewController: UIViewController, CLLocationManagerDelegate
{

    @IBOutlet weak var MapView: GMSMapView!
    
    @IBOutlet weak var NotificationButton: UIButton!
    
    @IBOutlet weak var MenuButton: UIButton!
    
    var locationManager = CLLocationManager()
    
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
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ImportExportNotification") as! ImportExportNotificationViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("notification button is clicked")
        
    }
    
    @IBAction func MenuAction(_ sender: UIButton) {
        let ImportExportMenu = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "importExportMenu") as! ImportExportMenuViewController
        self.addChild(ImportExportMenu)
        ImportExportMenu.view.frame = self.view.frame
        self.view.addSubview(ImportExportMenu.view)
        ImportExportMenu.didMove(toParent: self)
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
        
        
        self.MapView.camera = camera
        
        self.MapView.isMyLocationEnabled = true
        
        //        fetchRoute(from: center, to: destination)
        //        APImethod.myMap(from: center, to: destination) { (points) in
        //            let point : String! = points[0]!
        //            self.drawPath(from: point)
        //        }
        locationManager.stopUpdatingLocation()
        
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
