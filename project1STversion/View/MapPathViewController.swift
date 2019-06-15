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

//class DriverCurrentLocationViewController: UIViewController , CLLocationManagerDelegate {
//    @IBOutlet weak var mapView: GMSMapView!
//    @IBOutlet weak var buttonPlay: UIButton!
//    @IBAction func buttonHandlerPlay(_ sender: UIButton) {
//    }
//
//
//    var center = CLLocationCoordinate2D()
//    let destination = CLLocationCoordinate2D(latitude: 30.0159394, longitude: 31.2838786)
//
//    //    var currentLocation: CLLocation!
//    var locationManager = CLLocationManager()
//    lazy var mapView = GMSMapView()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        //        let lat = currentLocation.coordinate.latitude
//        //        let long = currentLocation.coordinate.longitude
//
//
//
//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.startUpdatingLocation()
//
//    }
//        override func loadView() {
//        let camera = GMSCameraPosition.camera(withLatitude:30.243127377031502, longitude: 31.72428846359253, zoom: 17)
//        myMapView.camera = camera
//
//        let carMarker = GMSMarker()
//        carMarker.position = CLLocationCoordinate2D(latitude:30.7777777, longitude: 30.4664646)
//        carMarker.title = "Hello World"
//        carMarker.map = myMapView
//
//        let startMarker = GMSMarker()
//        startMarker.position = CLLocationCoordinate2D(latitude: 30.243127377031502, longitude: 31.72428846359253)
//        startMarker.title = "Hello World"
//        startMarker.map = myMapView
//
//        let endmarker = GMSMarker()
//        endmarker.position = CLLocationCoordinate2D(latitude: 30.394893244198155, longitude: 30.98472196608782)
//        endmarker.title = "Hello World"
//        endmarker.map = myMapView
//    }
//
//    //MARK:- route draw
//
//    func fetchRoute(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {
//
//        let url = URL(string: "https://maps.googleapis.com/maps/api/directions/json?origin=\(source.latitude),\(source.longitude)&destination=\(destination.latitude),\(destination.longitude)&sensor=false&mode=driving&key=AIzaSyB7kcLWMSUcrIwIwzgccwXzoljlyp0qeHI")!
//
//        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
//            switch response.result{
//
//            case .failure(let error):
//                print("Error: ",error)
//                break
//
//            case .success(let value):
//                print("json: ",value)
//
//                var Points :[String?] = []
//                let json = JSON(value)
//                print("json",json)
//                if let Routes = json["routes"].array{
//                    for route in Routes{
//
//
//                        if let overview_polyline = route["overview_polyline"].dictionary{
//                            if let points = overview_polyline["points"]?.string{
//                                Points.append(points)
//
//                            }
//                        }
//
//
//                    }
//                    self.drawPath(from: Points[0]!)
//                }
//
//                //
//
//            }
//
//        }
//
//    }
//
//    //MARK:- end of route draw
//
//    func drawPath(from polyStr: String){
//        let path = GMSPath(fromEncodedPath: polyStr)
//        let polyline = GMSPolyline(path: path)
//        polyline.strokeWidth = 10.0
//        polyline.map = myMapView // Google MapView
//    }
//}
//
class MapPathViewController: UIViewController,GMSMapViewDelegate , MapPathViewModelDelegate{
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var buttonPlay: UIButton!
    
    var objMapModel = MapPathViewModel()
    var iTemp:Int = 0
    var marker = GMSMarker()
    var timer = Timer()
    
    
    //inially load location on map
    let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: 22.857165, longitude: 77.354613, zoom: 4.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageSetUp()
    }
    
    func pageSetUp()  {
        
        //Pass view controller delegate on view model page
        objMapModel.delegate = self
        //mapview delegate settings and inial location set
        mapView.delegate = self
        mapView.camera = camera
        
        objMapModel.jsonDataRead()
    }
    
    @IBAction func buttonHandlerPlay(_ sender: Any) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (_) in
            self.playCar()
        })
        buttonPlay.isEnabled = false
        RunLoop.current.add(timer, forMode: RunLoop.Mode.common)
    }
    
}

extension MapPathViewController{
    
    //Success json read delegate method
    func isSucessReadJson()  {
        drawPathOnMap()
    }
    
    //fail json read delegate method
    func isFailReadJson(msg : String)  {
        let alert = UIAlertController(title: "Map Alert", message: msg, preferredStyle: .alert)
        let actionOK : UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(actionOK)
        self.present(alert, animated: true, completion: nil)
    }
}

extension MapPathViewController{
    
    //path create
    func drawPathOnMap()  {
        let path = GMSMutablePath()
        let marker = GMSMarker()
        
        let inialLat:Double = objMapModel.arrayMapPath[0].lat!
        let inialLong:Double = objMapModel.arrayMapPath[0].lon!
        
        for mapPath in objMapModel.arrayMapPath
        {
            path.add(CLLocationCoordinate2DMake(mapPath.lat!, mapPath.lon!))
        }
        //set poly line on mapview
        let rectangle = GMSPolyline(path: path)
        rectangle.strokeWidth = 5.0
        marker.map = mapView
        rectangle.map = mapView
        
        //Zoom map with path area
        let loc : CLLocation = CLLocation(latitude: inialLat, longitude: inialLong)
        updateMapFrame(newLocation: loc, zoom: 12.0)
    }
    
    //marker move on map view
    func playCar()
    {
        if iTemp <= (objMapModel.arrayMapPath.count - 1 )
        {
            let iTempMapPath = objMapModel.arrayMapPath[iTemp]
            
            let loc : CLLocation = CLLocation(latitude: iTempMapPath.lat!, longitude: iTempMapPath.lon!)
            
            updateMapFrame(newLocation: loc, zoom: self.mapView.camera.zoom)
            marker.position = CLLocationCoordinate2DMake(iTempMapPath.lat!, iTempMapPath.lon!)
            
            marker.rotation = iTempMapPath.angle!
            
            marker.icon = UIImage(named: "map_car_running.png")
            marker.map = mapView
            
            // Timer close
            if iTemp == (objMapModel.arrayMapPath.count - 1)
            {
                // timer close
                timer.invalidate()
                buttonPlay.isEnabled = true
                iTemp = 0
            }
            iTemp += 1
        }
    }
    
    //Zoom map with cordinate
    func updateMapFrame(newLocation: CLLocation, zoom: Float) {
        let camera = GMSCameraPosition.camera(withTarget: newLocation.coordinate, zoom: zoom)
        self.mapView.animate(to: camera)
    }
    
}
