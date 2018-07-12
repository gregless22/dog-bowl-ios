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
	private init(){
		
		//create users position.  This is more mock data and probably needs to be moved to the map controller.
		let userLocation = CLLocationCoordinate2D(latitude: -26.657669, longitude: 153.102056)
		
		//container to hold the dog bowls.
		var myDogBowls:[DogBowl]
		
		//populate the dog bowls array
		myDogBowls = DogBowl.getBowls(4, userLocation, "no filter")
		
		
	}
	
	
	
	
	
}












