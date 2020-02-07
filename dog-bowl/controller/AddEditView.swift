//
//  AddEditView.swift
//  dog-bowl
//
//  Created by iMac on 18/8/18.
//  Copyright © 2018 sunny-coast-coders. All rights reserved.
//

import UIKit
import Eureka

class AddEditView: UIViewController {

    @IBAction func cancelButton(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
    @IBAction func doneButton(_ sender: Any) {
        //update the data
        let childController = self.childViewControllers[0] as! FormController
        childController.form.rowBy(tag: "name")?.updateCell()
        childController.form.rowBy(tag: "vicinity")?.updateCell()
        childController.form.rowBy(tag: "latitude")?.updateCell()
        childController.form.rowBy(tag: "longitude")?.updateCell()
        childController.form.rowBy(tag: "type")?.updateCell()
        childController.tableView.reloadData()
        areYouSure()
    }
    
    var imageEdit:UIImage?
    
    
    //Outlets
    @IBOutlet weak var imageView: UIImageView!
  
    
    //controller links
    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}


  // MARK: - Button Actions and Function

extension AddEditView {
    
    func changePhoto() {
        
        self.imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a Source", preferredStyle: .actionSheet)
        
        //action sheet for the camera
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            //check to make sure camera is not available
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.imagePickerController.sourceType = .camera
                self.present(self.imagePickerController, animated: true, completion: nil)
            }
            else {
                self.noCamera()
            }
       
        }))
        
        //action shhet for picking a photo form the library
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true, completion: nil)
        }))
        
        //The cancle button on the action sheet.
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil ))
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
}

  // MARK: - Image Picker Extension

extension AddEditView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //get the image
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //assign the image to the image view.
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        
        //close the UIpickerview
        picker.dismiss(animated: true, completion: nil)
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

  // MARK: - Custom Functions

extension AddEditView {
    
    func noCamera(){
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
    
    func areYouSure(){
        let alertVC = UIAlertController(
            title: "Save Changes",
            message: "Are you certain you wish to save changes",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style: .default)
            {(action: UIAlertAction) in
               //send to model to prepare for saving to core data
                let childController = self.childViewControllers[0] as! FormController
                Model.myModel.saveDogBowls(
                    name: childController.name,
                    establishmentType: childController.type,
                    longitude: childController.longitude!,
                    latitude: childController.latitude!,
                    vicinity: childController.vicinity,
                    image: self.imageView.image!)
            }
            //go to the map view.
            self.tabBarController?.customizableViewControllers![0].viewDidLoad()
              self.tabBarController?.selectedIndex = 0
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .cancel)
            {(action: UIAlertAction) in
                //go to map view.
            self.tabBarController?.customizableViewControllers![0].viewDidLoad()
            self.tabBarController?.selectedIndex = 0
            }
        alertVC.addAction(okAction)
        alertVC.addAction(cancelAction)
        present(alertVC, animated: true, completion: nil)
    }
}
