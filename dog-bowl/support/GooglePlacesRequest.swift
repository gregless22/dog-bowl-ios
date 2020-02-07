//
//  GooglePlacesRequest.swift
//  dog-bowl
//
//  Created by iMac on 13/8/18.
//  Copyright © 2018 sunny-coast-coders. All rights reserved.
//

import Foundation
import CoreLocation
import CoreData

public class GooglePlacesRequest {
    
    //get reference to the singleton network session
    let session = URLSession.shared
    
    //constants to help facilitate the API request.
    private let BASE_URL: String = "https://maps.googleapis.com/maps/api/place/"
    private let SEARCH_TYPE: String = "nearbysearch/"
    private var LATITUDE: String?
    private var LONGITUDE: String?
    private var TYPE: String = "&type=point_of_interest"
    private let RETURN_TYPE: String = "json"
    private let OPTIONAL: String = "&rankby=distance"
    private let API_KEY: String = "&key=AIzaSyDoNSo0C_HH0gBkByHa91xfWZBm0pyqdYA"

}

//extension for the functions
extension GooglePlacesRequest {
    
    //function to create search
    func createSearch(withLocation: CLLocation) -> URLRequest? {
        
        // Assign location to Latitude and Longitude Values.
        LATITUDE = String(withLocation.coordinate.latitude)
        LONGITUDE = String(withLocation.coordinate.longitude)
     
        //check that the latitude and longitude optionals are not nil before concatinating.
        guard
            let LATITUDE = LATITUDE,
            let LONGITUDE = LONGITUDE
        else {
            return nil
        }
      
        
        //create the API Request String
        let search = "\(BASE_URL)\(SEARCH_TYPE)\(RETURN_TYPE)?location=\(LATITUDE),\(LONGITUDE)\(API_KEY)\(TYPE)\(OPTIONAL)"
        
        //create the URLRequest object.  Returns a nil value on failure so needs to have "if let statement"
        if let urlSearch = URL(string: search) {

            let urlRequest = URLRequest(url: urlSearch)
            return urlRequest
            
        }
        
        return nil
    }
    
    //function to execute the search
    
    func executeSearch(request: URLRequest, element: String, results: @escaping ([NSDictionary]?) -> ()) {
        
        //container to hold establishments.
        var establishments: [NSDictionary] = []
        
        let task = session.dataTask(with: request, completionHandler: {data, response, error in
            
            //ensure that a response has been generated.
            guard
                let response = response
                else {
                    return
            }
            
            // if there is error print out the error and the response.
            if
                let error = error {
                print ("\(error)")
                print ("\(response)")
            }
                
            //if not continue with the data parsing and filtering.
            else {
                
                //create a variable to hold the data once it has been parsed form JSON.
                let parsedResult:Any!
                
                // give to swift API that parses JSON data.  Need do try statemyn as it can throw and exception
                do {
                    try parsedResult = JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                }
                catch
                    let error as NSError {
                    parsedResult = nil
                    print ("\(error)")
                }
                
                
                //parsing to an array structure
                if let establishmentsRaw = (parsedResult as AnyObject).value(forKey: element) as? NSArray {
                    for item in establishmentsRaw {
                        
                        //create new dictionary to hold
                        let establishment = NSMutableDictionary.init()
                        let item = item as! NSDictionary
                        
                        //Return custom dictionary to get rid of unwanted data.
                        if let lat = item.value(forKeyPath: "geometry.location.lat") {
                            establishment.setValue(lat as! Double, forKey: "latitude")
                        }
                        if let lng = item.value(forKeyPath: "geometry.location.lng")  {
                            establishment.setValue(lng as! Double, forKey: "longitude")
                        }
                        if let vic = item.value(forKeyPath: "vicinity") {
                            establishment.setValue(vic as? String, forKey: "vicinity")
                        }
                        if let name = item.value(forKeyPath: "name") {
                            establishment.setValue(name as? String, forKey: "description")
                        }
                        if let ID = item.value(forKeyPath: "id") {
                            establishment.setValue(ID as? String, forKey: "id")
                        }
                        establishments.append(establishment)
                    }
                }
             results(establishments)
            }
        })
        
        task.resume()
        
        
        
    }
    
}

