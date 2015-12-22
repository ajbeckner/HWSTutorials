//
//  ViewController.swift
//  Project19
//
//  Created by Anthony John Beckner on 12/21/15.
//  Copyright © 2015 ajbeckner. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var capitals:[Capital] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        let philly = Capital(title: "Philadelphia", coordinate: CLLocationCoordinate2D(latitude: 39.97, longitude: -75.20), info: "hometown")
        
        capitals.append(london)
        capitals.append(oslo)
        capitals.append(paris)
        capitals.append(rome)
        capitals.append(washington)
        capitals.append(philly)
        
        for capital in capitals{
            print(capital.title!,"is at",capital.coordinate.latitude,"and",capital.coordinate.longitude,".")
            mapView.addAnnotation(capital)
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

