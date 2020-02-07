//
//  NearbyBusinessTable.swift
//  dog-bowl
//
//  Created by iMac on 18/8/18.
//  Copyright © 2018 sunny-coast-coders. All rights reserved.
//

import UIKit
import CoreLocation

class NearbyBusinessTable: UITableViewController {
    
      
    var formDatasource: FormControllerDataSource?
    
    //back button in navigation header.
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //create location manager instance
    let locationManager = CLLocationManager()
    
    //the users initial point
    var previousPoint: CLLocation?
    
    
    //create instance of Google Places API
    let googleRequest = GooglePlacesRequest()
    
    //create container for request data
    var tableData: [NSDictionary] = []
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //how often to receive updates
        locationManager.distanceFilter = 50
        
        // reuqest the authorisation to get the users location before it can be used
        locationManager.requestWhenInUseAuthorization()
        
        //create the API request.
        guard
            let location = locationManager.location
            else {
                return
        }
        
        guard
            let request = googleRequest.createSearch(withLocation: location)
            else {
                return
        }
        
        googleRequest.executeSearch(request: request, element: "results") { (results: [NSDictionary]?) in
            if let results = results {
                //asign to the table data.
                self.tableData = results
            }
            self.tableView.reloadData()
        }
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nearbyCell", for: indexPath)
        
        //will need to finish all of this.
        
        cell.textLabel?.text = tableData[indexPath.row].value(forKey: "description") as? String
        cell.detailTextLabel?.text = tableData[indexPath.row].value(forKey: "vicinity") as? String

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = tableData[indexPath.row]
        
        //asign to the delegate.
        formDatasource?.receiveData(data: selectedItem)
        
        //close the view
        dismiss(animated: true, completion: nil)
    }
  
 


}


extension NearbyBusinessTable: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        //debug statement
        print ("Authorisation staus changed to \(status.rawValue)")
        
        //switch statemnt to change the map view.
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            //mapView.showsUserLocation = true
        default:
            locationManager.stopUpdatingLocation()
            //mapView.showsUserLocation = false
        }
        
    }
}

