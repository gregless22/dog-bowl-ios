//
//  Establishment.swift
//  dog-bowl
//
//  Created by Greg Connolly on 28/6/18.
//  Copyright © 2018 sunny-coast-coders. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

// establishment struct
struct Establishment {
	
	//create the variables
	let location:CLLocationCoordinate2D
	var description:String
	var type:EstablishmentType
	var vicinity:String
	
	// initialiser
	init(location:CLLocationCoordinate2D, description:String, type:EstablishmentType, vicinity:String) {
		self.location = location
		self.description = description
		self.type = type
		self.vicinity = vicinity
	}
	
	// initialiser for data from the google database.
	
	init(placeID:String) {
		
		//complete the API call.
		self.location = CLLocationCoordinate2D(latitude: -26.667067, longitude: 153.106091)
		self.description = "Hathi Indian Restaurant"
		self.type = EstablishmentType.other
		self.vicinity = "shop 15/140 Alexandra Parade, Alexandra Headland"
		
	}
	
	//function for getting the nearest establishment
	//this will be the call to the google API.
	
	
	
	
	
	
	
	
	//function to get the google place based upon the placeID which is what will be store in dog-bowl database
	
	
	
	
	
	
	
	
	
	// functions for retrieveal of information (is this better as one call and returning a tuple??)
	// get location
	func getLocation() -> CLLocationCoordinate2D {
		return location
	}
	
	func getDescription() -> String {
		return description
	}
	
	func getType() -> String {
		return type.name
	}
	
	func getVicinity() -> String {
		return vicinity
	}
	
	//functions for updating data upon user request
	//the only thing that may change here is the bowl type.  All of the other data is retrieved from google database.
	// it may be a function sent to google's location services API to update.  This is also part of assignment 3.
	
	
	
}

// enum creation for the establishment type
enum EstablishmentType:String {
	case restaurant, cafe, park, other, unknown
	
	var name: String {
		get {
			switch self {
				case .restaurant: return "Restaurant"
				case .cafe:return "Cafe"
				case .park: return "Park"
				case .other: return "Other"
				case .unknown: return "Unknown"
			}
		}
	}
	
	var color: UIColor {
		get {
			switch self {
				case .restaurant: return UIColor(red: 228, green: 205, blue: 254, alpha: 1)
				case .cafe:return UIColor(red: 162, green: 216, blue: 218, alpha: 1)
				case .park: return UIColor(red: 249, green: 187, blue: 157, alpha: 1)
				case .other: return UIColor(red: 139, green: 215, blue: 253, alpha: 1)
				case .unknown: return UIColor(red: 47, green: 45, blue: 46, alpha: 1)
			}
		}
	}

}
