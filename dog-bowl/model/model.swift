//
//  model.swift
//  dog-bowl
//  this swift file is for the implementation of the model. It is for ensuring that it is
//  a singelton and there is only one instance of the class.
//
//  Created by Greg Connolly on 28/6/18.
//  Copyright © 2018 sunny-coast-coders. All rights reserved.
//

import Foundation
import CoreLocation


class Model {
	
	//singleton for creation of one instance of MyModel
	static let myModel = Model()
	private init(){}
	
	//variables (not sure if this is the correct implementation)
	//var myDogBowls:[DogBowl]
	
	
}












// mock data required for assignment 2
// this would eventually be replaced by database data
enum MockData {
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
			case .iga: return ""
			case .cottonTreePark: return ""
			case .alexandraParade: return ""
			case .skatePark: return ""
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



