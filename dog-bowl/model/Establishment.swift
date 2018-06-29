//
//  Establishment.swift
//  dog-bowl
//
//  Created by Greg Connolly on 28/6/18.
//  Copyright © 2018 sunny-coast-coders. All rights reserved.
//

import Foundation
import CoreLocation

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

}
