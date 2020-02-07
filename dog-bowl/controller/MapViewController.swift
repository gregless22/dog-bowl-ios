//
//  MapController.swift
//  dog-bowl
//
//  Created by iMac on 13/7/18.
//  Copyright © 2018 sunny-coast-coders. All rights reserved.
//


import UIKit
import MapKit

//this needs to be changed to be 

class MapViewController: UIViewController, MapDelegate, UISearchBarDelegate {
	
	//outlets
	@IBOutlet weak var mapView: MKMapView!
    
    //create the UISearchController
    var resultSearchController:UISearchController? = nil
    
    //create location manager instance
    fileprivate let locationManager = CLLocationManager()
    
    //the users initial point
    fileprivate var previousPoint: CLLocation?
    
    // varibale for the total distance
    fileprivate var totalMovementDistance = CLLocationDistance(0)
	
    //get the data from the model
    let dogBowls = Model.myModel.myDogBowls
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //how often to receive updates
        locationManager.distanceFilter = 50
        
        // reuqest the authorisation to get the users location before it can be used
        locationManager.requestWhenInUseAuthorization()
        
       
        
        //center the map to the user
        if let location = locationManager.location {
            centerMapOnLocation(mapView, location)
        }
        
        //add the annotations to the map.
        self.addAnnotations()
        
        //code for to intialise the search table
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "LocationSearchTable") as! LocationSearchViewController
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        
        // initilise the search bar.
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for Location"
        navigationItem.titleView = resultSearchController?.searchBar
        
        //code to implement the search table results.
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        
        //link the mapkit variable to the location search view controller mapkit
        locationSearchTable.mapView = mapView
        
        // pass handle of parent controller (This one) to the child (location search controller)
        locationSearchTable.mapDelegate = self
	
    }
}


extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        //debug statement
        print ("Authorisation staus changed to \(status.rawValue)")
        
        //switch statemnt to change the map view.
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
        default:
            locationManager.stopUpdatingLocation()
            mapView.showsUserLocation = false
        }
        
    }
}

//extension for annotations
extension MapViewController {
    func addAnnotations() {
        //get all of the data to create the annotation
        
        for dogBowl in dogBowls {
            let myAnnotation = DogBowlAnnotation(
                coordinate: CLLocationCoordinate2D(
                    latitude: (dogBowl.establishment?.latitude)!,
                    longitude: (dogBowl.establishment?.longitude)!),
                description: dogBowl.name!,
                type: EstablishmentType(rawValue: (dogBowl.establishment?.establishmentType)!)!,
                rating: 0)
            
            mapView.addAnnotation(myAnnotation)
        }
        
    }
}

