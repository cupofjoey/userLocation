//
//  ViewController.swift
//  userLocation
//
//  Created by BishopHill on 4/14/17.
//  Copyright © 2017 Dumb Unicorn. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            let userLocation: CLLocation = locations[0]
            
            CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
                
                
                if error != nil {
                    
                    print(error)
                    
                } else {
                    
                    if let placemark = placemarks?[0] {
                        
                        var subThoroughfare = ""
                        
                        if placemark.subThoroughfare != nil {
                            
                            subThoroughfare = placemark.subThoroughfare!
                        }
                        
                        var thoroughfare = ""
                        
                        if placemark.thoroughfare != nil {
                            
                            thoroughfare = placemark.thoroughfare!
                        }
                        
                        var subLocality = ""
                        
                        if placemark.subLocality != nil {
                            
                            subLocality = placemark.subLocality!
                        }
                        
                        var subAdministrativeArea = ""
                        
                        if placemark.subAdministrativeArea != nil {
                            
                            subAdministrativeArea = placemark.subAdministrativeArea!
                        }
                        
                        var postalCode = ""
                        
                        if placemark.postalCode != nil {
                            
                            postalCode = placemark.postalCode!
                        
                        }
                        
                        var country = ""
                        
                        if placemark.country != nil {
                            
                            country = placemark.country!
                        
                        }
                        
                        print(subThoroughfare + thoroughfare + "\n" + subLocality + "\n" +
                            subAdministrativeArea + "\n" + postalCode + "\n" + country)
                
                }
            
            }

        }

    }
    
}
    
    




