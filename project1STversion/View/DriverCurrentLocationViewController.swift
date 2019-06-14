//
//  DriverCurrentLocationViewController.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 6/13/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import SwiftyJSON
import Alamofire

class DriverCurrentLocationViewController: UIViewController , CLLocationManagerDelegate {
    @IBOutlet weak var myMapView: GMSMapView!
    var center = CLLocationCoordinate2D()
    let destination = CLLocationCoordinate2D(latitude: 30.0159394, longitude: 31.2838786)
    
    //    var currentLocation: CLLocation!
    var locationManager = CLLocationManager()
    lazy var mapView = GMSMapView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        let lat = currentLocation.coordinate.latitude
        //        let long = currentLocation.coordinate.longitude
        
        
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
    }
    
//    func updateLocationoordinates(coordinates:CLLocationCoordinate2D) {
//        if destinationMarker == nil
//        {
//            destinationMarker = GMSMarker()
//            destinationMarker.position = coordinates
//            let image = UIImage(named:"destinationmarker")
//            destinationMarker.icon = image
//            destinationMarker.map = viewMap
//            destinationMarker.appearAnimation = kGMSMarkerAnimationPop
//        }
//        else
//        {
//            CATransaction.begin()
//            CATransaction.setAnimationDuration(1.0)
//            destinationMarker.position =  coordinates
//            CATransaction.commit()
//        }
//    }
//
//    // Camera change Position this methods will call every time
//    func mapView(mapView: GMSMapView, didChangeCameraPosition position: GMSCameraPosition) {
//        let destinationLocation = CLLocation()
//        if self.mapGesture == true
//        {
//            destinationLocation = CLLocation(latitude: position.target.latitude,  longitude: position.target.longitude)
//            destinationCoordinate = destinationLocation.coordinate
//            updateLocationoordinates(destinationCoordinate)
//        }
//    }
//    override func loadView() {
//        let camera = GMSCameraPosition.camera(withLatitude:30.7777777, longitude: 30.4664646, zoom: 17)
//        myMapView.camera = camera
//
//        let carMarker = GMSMarker()
//        carMarker.position = CLLocationCoordinate2D(latitude:30.7777777, longitude: 30.4664646)
//        carMarker.title = "Hello World"
//        carMarker.map = myMapView
//
//        let startMarker = GMSMarker()
//        startMarker.position = CLLocationCoordinate2D(latitude: 30.0159394, longitude: 31.2838786)
//        startMarker.title = "Hello World"
//        startMarker.map = mapView
//
//        let endmarker = GMSMarker()
//        endmarker.position = CLLocationCoordinate2D(latitude: 31.0159394, longitude: 32.2838786)
//        endmarker.title = "Hello World"
//        endmarker.map = mapView
//    }
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let latitude = locations.last?.coordinate.latitude
//        let longitude = locations.last?.coordinate.longitude
//        center = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
//        let camera = GMSCameraPosition.camera(withLatitude: latitude!, longitude: longitude!, zoom: 20)
//        
//        let currentLocation = GMSMarker()
//        currentLocation.position = destination
//        currentLocation.title = "My Current Location"
//        currentLocation.snippet = "I am here now"
//        currentLocation.map = myMapView
//        
//        
//        self.myMapView.camera = camera
//        
//        self.myMapView.isMyLocationEnabled = true
//        
//        fetchRoute(from: center, to: destination)
//        locationManager.stopUpdatingLocation()
//        
//    }
    
    //MARK:- route draw
    
    func fetchRoute(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {
        
        let url = URL(string: "https://maps.googleapis.com/maps/api/directions/json?origin=\(source.latitude),\(source.longitude)&destination=\(destination.latitude),\(destination.longitude)&sensor=false&mode=driving&key=AIzaSyB7kcLWMSUcrIwIwzgccwXzoljlyp0qeHI")!
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result{
                
            case .failure(let error):
                print("Error: ",error)
                break
                
            case .success(let value):
                print("json: ",value)
                
                var Points :[String?] = []
                let json = JSON(value)
                print("json",json)
                if let Routes = json["routes"].array{
                    for route in Routes{
                        
                        
                        if let overview_polyline = route["overview_polyline"].dictionary{
                            if let points = overview_polyline["points"]?.string{
                                Points.append(points)
                                
                            }
                        }
                        
                        
                    }
                    self.drawPath(from: Points[0]!)
                }
                
                //
                
            }
            
        }
        
    }
    
    //MARK:- end of route draw
    
    func drawPath(from polyStr: String){
        let path = GMSPath(fromEncodedPath: polyStr)
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 10.0
        polyline.map = myMapView // Google MapView
    }
}


