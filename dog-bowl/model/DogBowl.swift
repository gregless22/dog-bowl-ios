//
//  DogBowl.swift
//  dog-bowl
//
//  Created by Greg Connolly on 28/6/18.
//  Copyright © 2018 sunny-coast-coders. All rights reserved.
//

import Foundation
import CoreLocation


struct DogBowl {
	
	//variable required.
	let establishment:Establishment
	let photo: String
	let rating: Double
	
	
	//create an instance of the mockdata.
	static var mockDatam: [MockData] = MockData.getAll()
	
	
	//this init is for creating a finished dog bowl.
	init?(builder: DogBowlBuilder) {
		
		if let establishment = builder.establishment,	let photo = builder.photo, let rating = builder.rating {
			self.establishment = establishment
			self.photo = photo
			self.rating = rating
		}
		else {
			return nil
		}
	}
	
	//function to return dogbowls.  This will also instantiate the required instances.
	static func getBowls(_ howMany:Int,_ location:CLLocationCoordinate2D,_ filter:(String)?) -> [DogBowl] {
		
		//create return variable
		var dogBowls:[DogBowl] = []
		
		//implement mock up data of dog bowl based upon location.  This would normally be retrieved from a database.
		for i in 0...howMany {
			
			//create the builder
			let partialBowl = DogBowlBuilder()
			
			//populate the builder with data
			partialBowl.withPhoto(mockDatam[i].photos)
			partialBowl.withEstablishment(mockDatam[i].placeID)
			
			// add the finished complete bowl to the dogBowls array for return
			dogBowls.append(partialBowl.build())
		}
		return dogBowls
	}
}

//the dog bowl builder is for building up the dog bowl.  It will be an intermediate step and is usefull as it will be a means
// of ensure dogbowls are completed with all of the data.  It will also allow user to start building and then go to another part
// of the app while the builder remains in the memory.

class DogBowlBuilder {
	
	var establishment:Establishment?
	var photo: String?
	var rating: Double?
	
	//initialisation
	init() {
	}
	
	//functions to add data to the build.
	func withEstablishment(_ placeID:String) {
		self.establishment = Establishment(placeID)
	}
	
	func withPhoto(_ photo:String) {
		self.photo = photo
	}
	
	//function init a dog bowl.
	func build() -> DogBowl {
		rating = 0
		return DogBowl(builder: self)!
	}
	
}


// mock data required for assignment 2
// this would eventually be replaced by database data
enum MockData : String {
	case iga, cottonTreePark, alexandraParade, skatePark
	
	var placeID: String {
		get {
			switch self {
			case .iga: return "178bc8613e5a1d14f42dbe7e4604eb980d39faa5"
			default: return ""
			}
		}
	}
	
	var photos: String {
		get {
			switch self {
			case .iga: return "iga"
			case .cottonTreePark: return "cottonTreePark"
			case .alexandraParade: return "alexandrParade"
			case .skatePark: return "skatePark"
			}
		}
	}
	
	var description: String {
		get {
			switch self {
			case .cottonTreePark: return "Cotton Tree Park"
			case .alexandraParade: return "Cotton Tree Beach Park"
			case .skatePark: return "Alex Skate Park"
			default: return ""
			}
		}
	}
	
	var vicinity: String {
		get {
			switch self {
			case .cottonTreePark: return ""
			case .alexandraParade: return ""
			case .skatePark: return ""
			default: return ""
			}
		}
	}
	
	var types: EstablishmentType {
		get {
			switch self {
			case .iga: return .other
			case .cottonTreePark: return .park
			case .alexandraParade: return .park
			case .skatePark: return .park
			}
		}
	}
	
	var locations: CLLocationCoordinate2D {
		get {
			switch self {
			case .iga: return CLLocationCoordinate2D(latitude: -26.6629838, longitude: 153.0929365)
			case .cottonTreePark: return CLLocationCoordinate2D(latitude: -26.654553, longitude: 153.096495)
			case .alexandraParade: return CLLocationCoordinate2D(latitude: -26.653248, longitude: 153.102557)
			case .skatePark: return CLLocationCoordinate2D(latitude: -26.667715, longitude: 153.107124)
			}
		}
	}
	
	static func getAll() -> [MockData] {
		return [.iga, .cottonTreePark, .alexandraParade, .skatePark]
	}
	
}









