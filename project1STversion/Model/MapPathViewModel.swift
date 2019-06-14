//
//  MapPathViewModel.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 6/14/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

protocol MapPathViewModelDelegate {
    func isSucessReadJson()
    func isFailReadJson(msg : String)
}
class MapPathViewModel {
    
    var delegate : MapPathViewModelDelegate?
    var arrayMapPath : [MapPathViewModel] = []
    
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
    //Json File data get
    func jsonDataRead() {
        do {
            if let file = Bundle.main.url(forResource: "LocationData", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    parseJson(json: object)
                } else {
                    print("JSON is invalid")
                    delegate?.isFailReadJson(msg: "JSON is invalid")
                }
            } else {
                print("no file")
                delegate?.isFailReadJson(msg: "No File found")
            }
        } catch {
            print(error.localizedDescription)
            delegate?.isFailReadJson(msg: error.localizedDescription)
        }
    }
    
    //Pars json from array
    func parseJson(json : [String: Any])  {
        //print(json)
        let pathArray = json["Locations"] as! NSArray
        for data in pathArray
        {
            let dic = data as! NSDictionary
            //print(dic)
            guard let lat = dic.value(forKey: "lat") as? String else {
                return
            }
            guard let lon:String = dic.value(forKey: "long") as? String else {
                return
            }
            guard let angle:String = dic.value(forKey: "angle") as? String else {
                return
            }
            
            arrayMapPath.append(MapPathViewModel(lat: Double(lat), lon: Double(lon), angle: Double(angle)))
        }
        
        if arrayMapPath.count > 0
        {
            delegate?.isSucessReadJson()
        }
    }
    
}
