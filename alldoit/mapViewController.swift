//
//  mapViewController.swift
//  alldoit
//
//  Created by LeeYongJin on 04/10/2018.
//  Copyright © 2018 vian. All rights reserved.
//

import UIKit
import MapKit

class mapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //mapping accuracy set
        locationManager.requestWhenInUseAuthorization()
        //GPS autorization
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true

        //initialized Location
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D {
        
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpanMake(span, span)
        let pRegion = MKCoordinateRegionMake(pLocation, spanValue)
        myMap.setRegion(pRegion, animated: true)
        
        return pLocation
        
        // input Geoinfo(latitude, longitude) and showing on the mapView
    }
    
    func setAnnotaion(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span :Double, title strTitle:String, subtile strSubtitle:String) {
        
        let annotaion = MKPointAnnotation()
        annotaion.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        
        annotaion.title = strTitle
        annotaion.subtitle = strSubtitle
        myMap.addAnnotation(annotaion)
        
        //marking Specific area
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += ""
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += ""
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재위치"
            self.lblLocationInfo2.text = address
        })
        
        locationManager.stopUpdatingLocation()
        
        //현재 위치의 지역 정보 추출
        
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
            
            //현재 초기화된(혹은 초기값으로 지정된) 위치
        }
        else if sender.selectedSegmentIndex == 1 {
            // 단팟 스튜디오
            
            setAnnotaion(latitudeValue: 37.5610194, longitudeValue: 126.9202167, delta: 0.01, title: "단팟 스튜디오", subtile: "서울시 동교로27길 77")
            self.lblLocationInfo1.text = "Free set 1번"
            self.lblLocationInfo2.text = "단팟스튜디오 연남점"
        }
        
        else if sender.selectedSegmentIndex == 2 {
            // 우리집
            setAnnotaion(latitudeValue: 37.6207165, longitudeValue: 127.0582597, delta: 0.01, title: "Vian's Home", subtile: "서울시 노원구 거기어딘가 그쪽")
            self.lblLocationInfo1.text = "Free set 2번"
            self.lblLocationInfo2.text = "개발자네 집 인근 어딘가"
        }
    }
    
}
