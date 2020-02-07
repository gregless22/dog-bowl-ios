//
//  DogBowlDetailViewController.swift
//  dog-bowl
//
//  Created by iMac on 12/7/18.
//  Copyright © 2018 sunny-coast-coders. All rights reserved.
//

import UIKit
import MapKit

<<<<<<< Updated upstream
class DogBowlDetailViewController: UIViewController {
	

	@IBOutlet weak var rateButton: UIButton!
	@IBOutlet weak var reportButton: UIButton!
	@IBOutlet weak var updateButton: UIButton!
=======

class DogBowlDetailViewController: UIViewController, ModalViewControllerDelegate, MapDelegate {
	
    //create handl to Form Controller and to AddEditView Controller
    var addEditView: AddEditView?
    var formController: FormControllerDataSource?
	
	//outlets
>>>>>>> Stashed changes
	@IBOutlet weak var mapView: MKMapView!
	
	
	@IBOutlet weak var address: UILabel!
	@IBOutlet weak var type: UILabel!
	@IBOutlet weak var rating: CosmosView!
	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var imageDetail: UIImageView!
	// create variable to recieve table view data
	var dogBowlDetail: DogBowl?
<<<<<<< Updated upstream
=======

	
	//button functions
	@IBAction func rateButtonExecute(_ sender: Any) {
		self.definesPresentationContext = true
		self.providesPresentationContextTransitionStyle = true
		
		self.overlayBlurredBackgroundView()
	}
	
	@IBAction func updateButtonExecute(_ sender: Any) {
        //create the NSDictionary type to send
        let returnData = NSMutableDictionary.init()
        
        //populate the dictionary
        returnData.setValue(dogBowlDetail?.establishment?.vicinity, forKey: "vicinty")
        returnData.setValue(dogBowlDetail?.establishment?.establishmentType, forKey: "type")
        returnData.setValue(dogBowlDetail?.name, forKey: "description")
        returnData.setValue(dogBowlDetail?.establishment?.latitude, forKey: "latitude")
        returnData.setValue(dogBowlDetail?.establishment?.longitude, forKey: "longitude")
		
        //call the protocol function
        formController?.receiveData(data: returnData)
        
        //dismiss the current view.
        dismiss(animated: false, completion: nil)
        
        //return to the controller
        self.tabBarController?.selectedIndex = 2
       
        
	}
	
	
	@IBAction func reportButtonExecute(_ sender: Any) {
		let reportVC = storyboard?.instantiateViewController(withIdentifier: "reportBowl") as! ReportViewController
		reportVC.dogBowlReport = dogBowlDetail
		navigationController?.pushViewController(reportVC, animated: true)
	}
	
	//protocol for rating button overlay
		func overlayBlurredBackgroundView() {
			
			let blurredBackgroundView = UIVisualEffectView()
			
			blurredBackgroundView.frame = view.frame
			blurredBackgroundView.effect = UIBlurEffect(style: .dark)
			
			view.addSubview(blurredBackgroundView)
			
		}
	
	
		func removeBlurredBackgroundView() {
			
			for subview in view.subviews {
				if subview.isKind(of: UIVisualEffectView.self) {
					subview.removeFromSuperview()
				}
			}
		}
		
		override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
			if let identifier = segue.identifier {
				if identifier == "modalRating" {
					if let viewController = segue.destination as? PopoverRatingController {
						viewController.delegate = self
						viewController.modalPresentationStyle = .overFullScreen
					}
				}
			}
		}
	
>>>>>>> Stashed changes
	
    override func viewDidLoad() {
        super.viewDidLoad()

		// change image and populate with data
		imageDetail.image = UIImage(named: dogBowlDetail!.photo)
		label.text = dogBowlDetail!.description
		rating.rating = dogBowlDetail!.rating
		rating.text = "\(dogBowlDetail!.rating)"
		type.text = dogBowlDetail!.establishment.type.name
		type.backgroundColor = dogBowlDetail!.establishment.type.color
		address.text = dogBowlDetail?.establishment.vicinity
		
		// button actions to segue.
		
<<<<<<< Updated upstream
=======
		//update the map with the location
        let initialLocation = CLLocation(
            latitude: (dogBowlDetail.establishment?.latitude)!,
            longitude: (dogBowlDetail.establishment?.longitude)!)
		
            centerMapOnLocation(mapView, initialLocation)
		
        }
        //get all of the data to create the annotation
        let myAnnotation = DogBowlAnnotation(
            coordinate: CLLocationCoordinate2D(
                latitude: (dogBowlDetail?.establishment?.latitude)!,
                longitude: (dogBowlDetail?.establishment?.longitude)!),
            description: (dogBowlDetail?.name)!,
            type: EstablishmentType(rawValue: (dogBowlDetail?.establishment?.establishmentType)!)!,
            rating: 0)
        
       mapView.addAnnotation(myAnnotation)
>>>>>>> Stashed changes
    }

	
	
   override func didReceiveMemoryWarning() {
		
        // Dispose of any resources that can be recreated.
    }

}

