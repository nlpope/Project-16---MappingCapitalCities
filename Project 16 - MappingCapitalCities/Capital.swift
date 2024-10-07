//
//  Capital.swift
//  Project 16 - MappingCapitalCities
//
//  Created by Noah Pope on 10/7/24.
//

import MapKit
import UIKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title      = title
        self.coordinate = coordinate
        self.info       = info
    }
}
