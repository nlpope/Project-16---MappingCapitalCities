//
//  ViewController.swift
//  Project 16 - MappingCapitalCities
//
//  Created by Noah Pope on 10/7/24.
//

import MapKit
import UIKit

class ViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCities()
    }
    
    func setUpCities() {
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Oslo Olympics")
    }


}

