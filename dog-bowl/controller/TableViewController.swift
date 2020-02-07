//
//  DogBowlListTableViewController.swift
//  dog-bowl
//
//  Created by iMac on 12/7/18.
//  Copyright © 2018 sunny-coast-coders. All rights reserved.
//

import UIKit


class DogBowlListCell: UITableViewCell {
	@IBOutlet weak var imageCustom: UIImageView!
	@IBOutlet weak var headingCustom: UILabel!
	@IBOutlet weak var cosmosCustom: CosmosView!
	@IBOutlet weak var typeCustom: UILabel!
	@IBOutlet weak var distanceCustom: UILabel!


}

class DogBowlListTableViewController: UITableViewController {
	
	
	// get the data from the model
	var dogBowlList = Model.myModel.getDogBowls()
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dogBowlList.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dogBowlCell", for: indexPath) as! DogBowlListCell
		
		//create instance of the dogbowl
		let dogBowl:DogBowl = dogBowlList[indexPath.row]
		
      // Configure the cell...
		
		
<<<<<<< Updated upstream
		cell.imageCustom!.image = UIImage(named: dogBowl.photo)
		cell.headingCustom!.text = dogBowl.description
		cell.cosmosCustom.rating = dogBowl.rating
		cell.cosmosCustom.text = "\(dogBowl.rating)"
		cell.typeCustom!.text = dogBowl.establishment.type.name
		cell.typeCustom!.backgroundColor = dogBowl.establishment.type.color
		cell.distanceCustom!.text = "Distance: 100m" // need to create function for distance calculation.
=======
        cell.imageCustom!.image = UIImage(data: dogBowl.imgData! as Data)
        cell.headingCustom!.text = dogBowl.name
//        cell.cosmosCustom.rating = dogBowl.rating
//        cell.cosmosCustom.text = "\(dogBowl.rating)"
       
        cell.typeCustom!.text = dogBowl.establishment?.establishmentType
        cell.typeCustom!.backgroundColor = establishment?.color

>>>>>>> Stashed changes
		
        return cell
    }
	


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		let indexPath = self.tableView.indexPathForSelectedRow!
		let dogBowl:DogBowl = dogBowlList[indexPath.item]
		
		let detailViewController = segue.destination as! DogBowlDetailViewController
		
		detailViewController.dogBowlDetail = dogBowl
        
    }


}
