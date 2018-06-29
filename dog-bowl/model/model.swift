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



class Model {
	
	//singleton for creation of one instance of MyModel
	static let myModel = Model()
	
	//variables (not sure if this is the correct implementation)
	var myDogBowls:[DogBowl]
	
	
}


// add attributes to myModel such as array of dog bowls, map instance, user information.


