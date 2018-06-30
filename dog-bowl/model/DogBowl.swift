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
	var mockDatam: [MockData] = MockData.getAll()
	
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
	func getBowls(howMany:Int, location:CLLocationCoordinate2D, filter:(String)?) -> [DogBowl] {
		
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
	
	
	func build() -> DogBowl {
		rating = 0
		return DogBowl(builder: self)!
	}
	
}








