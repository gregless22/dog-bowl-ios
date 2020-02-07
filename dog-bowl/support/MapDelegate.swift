//
//  MapDelegate.swift
//  dog-bowl
//
//  Created by iMac on 9/8/18.
//  Copyright © 2018 sunny-coast-coders. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

public protocol MapDelegate {
    
}

extension MapDelegate {
    
    //function to change the map view to the user.
    func centerMapOnLocation(_ mapView: MKMapView,_ location: CLLocation) {
            let span = MKCoordinateSpanMake(0.02, 0.02)
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(coordinateRegion, animated: true)
        
    }


}

// new class created for the annotation objects of the dogbowl.  These annotations will
// be displayed on the map.  The data is current temporarily retrieved from the mock data.

class DogBowlAnnotation: NSObject, MKAnnotation {

    // variables of the class.
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let type: EstablishmentType
    let rating: Double?


    // initialiser.  I wonder if this is easier just to pass in an entire dogBowl object?? or too slow.
    init(coordinate: CLLocationCoordinate2D, description: String, type: EstablishmentType, rating: Double) {
        self.coordinate = coordinate
        self.title = description
        self.type = type
        self.rating = rating
        super.init()
    }


}
