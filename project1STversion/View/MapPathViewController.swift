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
class MapPathViewController: UIViewController,GMSMapViewDelegate , MapPathViewModelDelegate{
    @IBOutlet weak var Distance: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var buttonPlay: UIButton!
    
    var objMapModel = MapPathViewModel()
    var iTemp:Int = 0
    var marker = GMSMarker()
    var timer = Timer()
    
    
    //inially load location on map
    let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: 30.39509105362621, longitude: 30.98486144095659, zoom: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "appLogo-1"))

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
        timer = Timer.scheduledTimer(withTimeInterval: 1.4, repeats: true, block: { (_) in
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
        updateMapFrame(newLocation: loc, zoom: 20.0)
    }
    
    //marker move on map view
    func playCar()
    {
        if iTemp <= (objMapModel.arrayMapPath.count - 1 )
        {
            let iTempMapPath = objMapModel.arrayMapPath[iTemp]
            
            let loc : CLLocation = CLLocation(latitude: iTempMapPath.lat!, longitude: iTempMapPath.lon!)
            print("last lat lon: ",iTempMapPath.lat,",",iTempMapPath.lon)
            let url = URL(string: "https://maps.googleapis.com/maps/api/directions/json?origin=\(iTempMapPath.lat!),\(iTempMapPath.lon!)&destination=30.397222395881734,30.9846555814147&sensor=false&mode=driving&key=AIzaSyB7kcLWMSUcrIwIwzgccwXzoljlyp0qeHI")!
            // 30.397222395881734",
            //"long": "30.9846555814147
            Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
                switch response.result{
                    
                case .failure(let error):
                    print("Error: ",error)
                    break
                    
                case .success(let value):
                    print("json: ",value)
                    
                    var Distance :[String?] = []
                    var Duration :[String?] = []
                    let json = JSON(value)
                    print("json",json)
                    if let Routes = json["routes"].array{
                        for route in Routes{
                            
                            
                            if let legs = route["legs"].array{
                                for leg in legs {
                                    if let distance = leg["distance"].dictionary{
                                        if let distanceText = distance["text"]?.string{
                                            if let duration = leg["duration"].dictionary{
                                                if let durationText = duration["text"]?.string{
                                                    Distance.append(distanceText)
                                                    Duration.append(durationText)
                                                    
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        self.Distance.text = Distance[0]
                        self.timeLabel.text = Duration[0]
                    }
                }
            }
            
            updateMapFrame(newLocation: loc, zoom: self.mapView.camera.zoom)
            marker.position = CLLocationCoordinate2DMake(iTempMapPath.lat!, iTempMapPath.lon!)
            
            marker.rotation = iTempMapPath.angle!
            
            marker.icon = UIImage(named: "truckSymbol")
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
