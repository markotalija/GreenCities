//
//  MapViewController.swift
//  Green Cities
//
//  Created by Marko Rankovic on 11/27/18.
//  Copyright © 2018 Marko Rankovic. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var mapView: MKMapView!
    let regionRadius: CLLocationDistance = 5000
    var city: City!

    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Navigation bar title
        title = city.name
        
        setCityLocation()
    }
    
    //MARK: - Private API
    
    private func setCityLocation() {
        
        let latitude = (city.latitude as NSString).doubleValue
        let longitude = (city.longitude as NSString).doubleValue
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        mapView.setRegion(region, animated: true)
        
        //Add a location pin
        let annotation = MKPointAnnotation()
        annotation.title = city.name
        annotation.subtitle = city.country
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
}
