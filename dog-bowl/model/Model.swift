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
<<<<<<< Updated upstream
	
	//singleton for creation of one instance of MyModel
	static let myModel = Model()
	
	//container to hold the dog bowls.
	var myDogBowls:[DogBowl]
	
	private init(){
		
		//create users position.  This is more mock data and probably needs to be moved to the map controller.
		let userLocation = CLLocationCoordinate2D(latitude: -26.657669, longitude: 153.102056)
		
		//populate the dog bowls array
		myDogBowls = DogBowl.getBowls(3, userLocation, "no filter")
		
		
	}
	
	func getDogBowls() -> [DogBowl] {
		return myDogBowls
	}
	
	
	
=======
    
    // dispatch queues this has yet been implemented.  Will need to do so.
//    let convertQueue = DispatchQueue.self
//    let saveQueue = DispatchQueue.self
    
    //singleton for creation of one instance of MyModel
    static let myModel = Model()
    
    //create a link to the appdelegate file
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // create a managed context variable
    let managedContext: NSManagedObjectContext
    
    //container to hold the dog bowls and one for the erros.
    var myDogBowls = [DogBowl]()
    var myErrors = [ErrorRecording]()
    
    private init(){
        
        //create a link to the managed context data.
       managedContext = appDelegate.persistentContainer.viewContext
        
        //populate the dog bowls array
        getDogBowls()
        myErrors = []
       
    }


>>>>>>> Stashed changes
}


<<<<<<< Updated upstream
=======
    func saveDogBowls(name: String, establishmentType: EstablishmentType, longitude: Double, latitude: Double, vicinity: String, image: UIImage) {
        
        var imageSave:NSData?
        
        //complete image processing this should be completed async in the future
        imageSave = self.prepareImageForSaving(image: image)
        
        //create a new dog bowl
        let dogBowlEntity = NSEntityDescription.entity(forEntityName: "DogBowl", in: managedContext)
        let dogBowl = NSManagedObject(entity: dogBowlEntity!, insertInto: managedContext) as! DogBowl

        //create a new establishment
        let establishmentEntity = NSEntityDescription.entity(forEntityName: "Establishment", in: managedContext)
        let establishment = NSManagedObject(entity: establishmentEntity!, insertInto: managedContext) as! Establishment
        
       //populate with data.
        establishment.setValue(longitude, forKey: "longitude")
        establishment.setValue(latitude, forKey: "latitude")
        establishment.setValue(vicinity, forKey: "vicinity")
        establishment.setValue(establishmentType.rawValue, forKey: "establishmentType")
        dogBowl.setValue(name, forKey: "name")
        dogBowl.setValue(establishment, forKey: "establishment")
        dogBowl.setValue(imageSave, forKey: "imgData")
        myDogBowls.append(dogBowl)

        updateDatabase()
    }

    func addError(_ error: ErrorRecording) {
        myErrors.append(error)
    }
    
}
>>>>>>> Stashed changes










