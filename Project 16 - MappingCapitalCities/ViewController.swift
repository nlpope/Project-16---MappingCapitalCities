//
//  ViewController.swift
//  Project 16 - MappingCapitalCities
//
//  Created by Noah Pope on 10/7/24.
//

import MapKit
import UIKit

class ViewController: UIViewController & MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    var london: Capital!
    var oslo: Capital!
    var paris: Capital!
    var rome: Capital!
    var washington: Capital!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        specifyMap()
        setUpCities()
        addAnnotations()
    }
    
    
    func specifyMap() {
        let ac      = UIAlertController(title: "Pick map style", message: "Which map style do you prefer?", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Satellite", style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.presentSatelliteView()
        })
        
        ac.addAction(UIAlertAction(title: "Standard", style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.presentStandardView()
        })
        present(ac, animated: true)
    }
    
    
    func presentSatelliteView() {
        mapView.mapType = .satellite
    }
    
    
    func presentStandardView() {
        mapView.mapType = .standard
    }
    
    
    func setUpCities() {
        london      = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics", siteUrl: "https://en.wikipedia.org/wiki/London")
        oslo        = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.", siteUrl: "https://en.wikipedia.org/wiki/Oslo")
        paris       = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the city of light", siteUrl: "https://en.wikipedia.org/wiki/Paris")
        rome        = Capital(title: "Roma", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.", siteUrl: "https://en.wikipedia.org/wiki/Rome")
        washington  = Capital(title: "Washington", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.", siteUrl: "https://en.wikipedia.org/wiki/Washington,_D.C.")
    }
    
    
    func addAnnotations() { mapView.addAnnotations([london, oslo, paris, rome, washington]) }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        // 1
        guard annotation is Capital else { return nil }
        // 2
        let identifier      = "Capital"
        // 3
        var annotationView  = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        if annotationView == nil {
            // 4
//            annotationView                              = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView                              = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout              = true
            
            // 5
            let btn                                     = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView   = btn
        } else {
            // 6
            annotationView?.annotation                  = annotation
        }
        
        annotationView?.pinTintColor                    = .red
        return annotationView
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital   = view.annotation as? Capital else { return }
        let placeName       = capital.title
        let placeInfo       = capital.info
        
        let ac              = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "\(capital.title!) Wiki", style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.presentDetailsWebVC(withCity: capital)
        })
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    
    func presentDetailsWebVC(withCity city: Capital) {
        let vc          = DetailsWebVC()
        vc.selectedCity = city
        navigationController?.pushViewController(vc, animated: true)
    }
}

