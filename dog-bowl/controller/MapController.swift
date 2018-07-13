//
//  MapController.swift
//  dog-bowl
//
//  Created by iMac on 13/7/18.
//  Copyright © 2018 sunny-coast-coders. All rights reserved.
//
//		Reference: https://www.raywenderlich.com/160517/mapkit-tutorial-getting-started

import UIKit
import MapKit

class MapController: UIViewController {
	
	//outlets
	@IBOutlet weak var mapView: MKMapView!
	
	//variables. This will eventually include a request for location
	let initialLocation = CLLocation(latitude: -26.657669, longitude: 153.10205)
	let regionRadius: CLLocationDistance = 1500
	var dogBowlList = Model.myModel.getDogBowls()
	
	//custom functions
	//function to centre the location
	func centerMapOnLocation(location: CLLocation) {
		let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
																					 regionRadius, regionRadius)
		mapView.setRegion(coordinateRegion, animated: true)
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		//on view load call the centre map locaiton function
		centerMapOnLocation(location: initialLocation)
		
		//create instances of Annotation of nearby dogBowls
		//container for holding the annotations
		//var dogBowlAnnotations:[DogBowlAnnotation] = []
		
		// run through the list of dogBowls
		for i in 0..<dogBowlList.count {
			mapView.addAnnotation(DogBowlAnnotation(coordinate: dogBowlList[i].establishment.location, description: dogBowlList[i].description, type: dogBowlList[i].establishment.type, rating: dogBowlList[i].rating))
			
			// might see if ican just add it to the map.
			
		}
		
		
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
		
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
