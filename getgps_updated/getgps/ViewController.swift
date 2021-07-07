//
//  ViewController.swift
//  getgps
//
//  Created by 池田佳弘 on 2021/07/04.
//  参考：https://fluffy.es/current-location/
//  参考：https://qiita.com/kj_trsm/items/66e07c61ce4a3142832f
//  参考：https://qiita.com/r0227n/items/6ae818adaab029436bf5
//  参考：advancedswift.com/user-location-in-swift/
//  参考：https://softauthor.com/ios-swift-get-user-location-real-time/

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    
    // 位置座標を格納する変数を定義
    var locationManager: CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        getUserLocation()
    }
    
    func getUserLocation(){
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            //latLngLabel.text = "Lat : \(location.coordinate.latitude) \nLng : \(location.coordinate.longitude)"
            latitude.text = "\(location.coordinate.latitude)"
            longitude.text = "\(location.coordinate.longitude)"
        }
    }
}
