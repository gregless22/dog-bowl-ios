//
//  DogBowlDetailViewController.swift
//  dog-bowl
//
//  Created by iMac on 12/7/18.
//  Copyright © 2018 sunny-coast-coders. All rights reserved.
//

import UIKit
import MapKit

class DogBowlDetailViewController: UIViewController {
	

	@IBOutlet weak var rateButton: UIButton!
	@IBOutlet weak var reportButton: UIButton!
	@IBOutlet weak var updateButton: UIButton!
	@IBOutlet weak var mapView: MKMapView!
	
	
	@IBOutlet weak var address: UILabel!
	@IBOutlet weak var type: UILabel!
	@IBOutlet weak var rating: CosmosView!
	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var imageDetail: UIImageView!
	// create variable to recieve table view data
	var dogBowlDetail: DogBowl?
	
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
		
    }

	
	
   override func didReceiveMemoryWarning() {
		
        // Dispose of any resources that can be recreated.
    }

}
