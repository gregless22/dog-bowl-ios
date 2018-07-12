//
//  DogBowlDetailViewController.swift
//  dog-bowl
//
//  Created by iMac on 12/7/18.
//  Copyright © 2018 sunny-coast-coders. All rights reserved.
//

import UIKit

class DogBowlDetailViewController: UIViewController {
	
	@IBOutlet weak var imageDetail: UIImageView!
	// create variable to recieve table view data
	var dogBowlDetail: DogBowl?
	
    override func viewDidLoad() {
        super.viewDidLoad()

		
		//var imageDetailCurrent:String?
		
		// change image
		imageDetail.image = UIImage(named: dogBowlDetail!.photo)
		
	
		
    }

	
	
   override func didReceiveMemoryWarning() {
		
        // Dispose of any resources that can be recreated.
    }

}
