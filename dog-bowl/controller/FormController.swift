//
//  FormController.swift
//  dog-bowl
//
//  Created by iMac on 18/8/18.
//  Copyright © 2018 sunny-coast-coders. All rights reserved.
//

import UIKit
import Eureka
//import ImageRow
import TableRow
import CoreLocation

protocol FormControllerDataSource {
    func receiveData(data: NSDictionary)
    func updateData(string: String)
}

class FormController: FormViewController {
    
    // get the initial Location
    //create location manager instance
    fileprivate let locationManager = CLLocationManager()
    
    
    //create variables to hold initial data.
    var name = ""
    var vicinity = ""
    var latitude:Double?
    var longitude:Double?
    var id = ""
    var type:EstablishmentType = .unknown
    
    

    //might have to try just re -initialising the entire form controller.

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create a link to the delegate in the DetailedViewTable this can be doen here as the tabbar controller loads all views.
        //and then link to the detailed view.
    
        
        
        //turn off scrolling as it is already inside a UIScroll in the parent
        self.tableView.isScrollEnabled = false;
        
        if let location = self.getLocation() {
            longitude = location.coordinate.longitude
            latitude = location.coordinate.latitude
        } else {
            longitude = 0.00
            latitude = 0.00
        }
        
        
        
        
            form
            +++ Section()
            <<< ButtonRow() {
                $0.title = "Change Image"
                $0.onCellSelection{ cell, row in
                    let parentController = self.parent as! AddEditView
                    parentController.changePhoto()
                }
                $0.cellUpdate{ cell, row in
                    cell.tintColor = UIColor.lightGray
                    cell.textLabel?.textAlignment = .left
                    cell.accessoryView = UIImageView(image: UIImage(named: "camera"))
                    cell.accessoryView?.frame = CGRect(x: -0, y: 0, width: 25, height: 25)
                }
                
            }
            
            +++ Section()
            <<< ButtonRow("Input Data") {
                    $0.title = "Pre-Populate Data From Google"
                    $0.onCellSelection{ cell, row in
                    self.googleAPI()
                }
                $0.cellUpdate{ cell, row in
                    cell.tintColor = UIColor.lightGray
                    cell.textLabel?.textAlignment = .left
                    cell.accessoryView = UIImageView(image: UIImage(named: "waypoint-blue"))
                    cell.accessoryView?.frame = CGRect(x: -0, y: 0, width: 25, height: 25)
                }
            }
            
            +++ Section("Enter Manually")
            <<< TextRow(){ row in
                    row.title = "Bowl Name"
                    row.tag = "name"
                    row.placeholder = "Enter Bowl Name"
                }.cellUpdate{ cell, row in
                    row.value = self.name
                }
            <<< TextRow(){ row in
                    row.title = "Address"
                    row.placeholder = "Enter Address"
                    row.tag = "vicinity"
                }.cellUpdate{ cell,row in
                    row.value = self.vicinity
            }
            <<< TableInlineRow<String> { row in
                    //get the type from the EstablishmentType enum
                    let optionsRaw = EstablishmentType.getAll()
                    var options:[String] = []
                    for option in optionsRaw {
                        options.append(option.name)
                    }
                    row.tag = "type"
                    row.title = "Type"
                    row.subcellTextColor = UIColor.lightGray
                    row.options = options
                    row.value = type.name
                    }.cellUpdate{ cell, row in
                        self.type = EstablishmentType(rawValue: row.value!.lowercased())!
                    }
            
            +++ Section("Current Location")
            <<< TextRow(){
                    $0.title = "Longitude"
                    $0.placeholder = "\(String(describing: self.longitude!))"
                    $0.tag = "longitude"
                }.cellUpdate{ cell, row in
                    if let value = row.value {
                        self.longitude = Double(value)
                    }
                    if let lng = self.longitude {
                        row.value = "\(String(describing: lng))"
                    }
                    
                }
        
            <<< TextRow(){
                    $0.title = "Latitude"
                    $0.placeholder = "\(String(describing: self.latitude!))"
                    $0.tag = "latitude"
                }.cellUpdate{ cell, row in
                    if let value = row.value {
                        self.latitude = Double(value)
                    }
                    if let lat = self.latitude {
                        row.value = "\(String(describing: lat))"
                    }
                    
                }
        
    }
    
}

//MARK :- This extension is to implement the function to call the google API and table view.  it may need to be split up to ensure the table is populated with data first.
extension FormController {
    func googleAPI() {
        
        //ideally this would be completed in the main class area, that way it would load as the view loads.  The current
        //method wont work though due to the use of storyboard! which isnt initialised.
        
        //create the instance of the table first.
        let nearbyBusinessNav = storyboard!.instantiateViewController(withIdentifier: "NearbyBusinessNav") as! UINavigationController
        
        //assign the delegate in the NearbyBusinessTable
        let nearbyBusinesTable = nearbyBusinessNav.viewControllers[0] as! NearbyBusinessTable
        nearbyBusinesTable.formDatasource = self
        
        // load up the instance of the view
        self.present(nearbyBusinessNav, animated: true, completion: nil)
        

    }
    
}

//this extension is to get the data back form the googleAPI table and then to update the form
extension FormController: FormControllerDataSource {
    //    MARK: - Protocol Stubs
    func receiveData(data: NSDictionary) {
        
        self.name = data.value(forKey: "description") as! String
        self.vicinity = data.value(forKey: "vicinity") as! String
        self.latitude = data.value(forKey: "latitude") as? Double
        self.longitude = data.value(forKey: "longitude") as? Double
        self.id = data.value(forKey: "id") as! String
        
        //update the rows by selecting tags.
        self.form.rowBy(tag: "name")?.updateCell()
        self.form.rowBy(tag: "vicinity")?.updateCell()
        self.form.rowBy(tag: "latitude")?.updateCell()
        self.form.rowBy(tag: "longitude")?.updateCell()
        tableView.reloadData()
    }
    
    
    func updateData(string: String) {
        print(string)
    }
}

//this extension returns the current location.
extension FormController: CLLocationManagerDelegate {

    func getLocation() -> CLLocation? {
        //start the location manager delegate
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //how often to receive updates
        locationManager.distanceFilter = 50
        
        // reuqest the authorisation to get the users location before it can be used
        locationManager.requestWhenInUseAuthorization()
        
        //this is form the location manager
        return locationManager.location
    }

}


