//
//  DogBowl.swift
//  dog-bowl
//
//  Created by Greg Connolly on 28/6/18.
//  Copyright © 2018 sunny-coast-coders. All rights reserved.
//

import Foundation


struct DogBowl {
	let establishment:Establishment
	let photo: String
	let rating: Double
	
	init() {
		self.establishment = Establishment(placeID: "ChIJrTLr-GyuEmsRBfy61i59si0")
		self.photo = "Complete this to get phot from the database"
		self.rating = 5 //this will also be updated as a query from the database
	}
	
}
