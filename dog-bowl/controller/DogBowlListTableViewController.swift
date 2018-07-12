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
	@IBOutlet weak var ratingCustom: UIView!
	@IBOutlet weak var typeCustom: UIView!
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
		
		
		cell.imageCustom!.image = UIImage(named: dogBowl.photo)
		cell.headingCustom!.text = dogBowl.establishment.description
		//cell.ratingCustom! = UIImage(named: dogBowl.rating)
		//cell.typeCustom! = UIImage(named: dogBowl.rating)
		cell.distanceCustom!.text = "Distance: 100m" // need to create function for distance calculation.
		
        return cell
    }
	

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		let indexPath = self.tableView.indexPathForSelectedRow!
		let dogBowl:DogBowl = dogBowlList[indexPath.item]
		
		let detailViewController = segue.destination as! DogBowlDetailViewController
		
		detailViewController.dogBowlDetail = dogBowl
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
