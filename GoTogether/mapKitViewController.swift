//
//  mapKitViewController.swift
//  GoTogether
//
//  Created by pinkamon on 9/20/2560 BE.
//  Copyright © 2560 pinkamon. All rights reserved.
//

import UIKit
import MapKit

class mapKitController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate{
    

    @IBOutlet weak var m_Mapview: MKMapView!
    
    
    var m_LocationManager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        GoToCenterLocation()
    }
    
    func GoToCenterLocation()
    {
        if let locMan = m_LocationManager.location
        {
            let region = MKCoordinateRegionMakeWithDistance(locMan.coordinate, 400, 400)
            m_Mapview.setRegion(region, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        m_LocationManager.delegate = self
        m_LocationManager.desiredAccuracy = kCLLocationAccuracyBest
        m_Mapview.delegate = self
        
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse && CLLocationManager.authorizationStatus() != .authorizedAlways
        {
            m_LocationManager.requestWhenInUseAuthorization()
        }
        m_Mapview.showsUserLocation = true
        m_LocationManager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

