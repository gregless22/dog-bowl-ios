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
	let description: String
	
	
	//create an instance of the mockdata.
	static var mockDatam: [MockData] = MockData.getAll()
	
	
	//this init is for creating a finished dog bowl.
	init?(builder: DogBowlBuilder) {
		
		if let establishment = builder.establishment,
			let photo = builder.photo,
			let rating = builder.rating,
			let description = builder.description {
			
				self.establishment = establishment
				self.photo = photo
				self.rating = rating
				self.description = description
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
			if mockDatam[i].placeID != "" {
				partialBowl.withEstablishment(mockDatam[i].placeID)
			}
			else {
				partialBowl.withEstablishment(mockDatam[i].locations, mockDatam[i].description, mockDatam[i].types)
			}
			
			partialBowl.withRating(mockDatam[i].ratings)
			partialBowl.withDescription(mockDatam[i].description)
			
			// add the finished complete bowl to the dogBowls array for return
			dogBowls.append(partialBowl.build())
			
			//arrange the dog bowls in order of distance from user location before returning
			//
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
	var description: String?
	
	//initialisation
	init() {
	}
	
	//functions to add data to the build.
	func withEstablishment(_ placeID:String) {
		self.establishment = Establishment(placeID)
	}
	
	func withEstablishment(_ location:CLLocationCoordinate2D,_ description:String,_ type:EstablishmentType) {
		self.establishment = Establishment(location, description, type)
	}
	
	func withDescription(_ description:String) {
		self.description = description
	}
	
	func withPhoto(_ photo:String) {
		self.photo = photo
	}
	
	func withRating(_ rating:Double){
		self.rating = rating
	}
	
	//function init a dog bowl.
	func build() -> DogBowl {
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
			case .alexandraParade: return "alexandraParade"
			case .skatePark: return "skatePark"
			default: return ""
			}
		}
	}
	
	var description: String {
		get {
			switch self {
			case .cottonTreePark: return "Cotton Tree Park"
			case .alexandraParade: return "Cotton Tree Beach Park"
			case .skatePark: return "Alex Skate Park"
			case .iga: return "IGA Maroochydore"
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
	
	var ratings: Double {
		get {
			switch self {
				case .iga: return 2.8
				case .cottonTreePark: return 3.2
				case .alexandraParade: return 4
				case .skatePark: return 3.5
			}
		}
	}
	
	static func getAll() -> [MockData] {
		return [.iga, .cottonTreePark, .alexandraParade, .skatePark]
	}
	
} //end bracket









