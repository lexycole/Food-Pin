//
//  AddTableViewController.swift
//  FoodPin
//
//  Created by IOS Developer on 11/25/21.
//  Copyright (c) 2021 AppCoda. All rights reserved.
//

import UIKit
import CoreData

class AddTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var nameTextField:UITextField!
    @IBOutlet weak var typeTextField:UITextField!
    @IBOutlet weak var locationTextField:UITextField!
    @IBOutlet weak var yesButton:UIButton!
    @IBOutlet weak var noButton:UIButton!
    
    var isVisited = true
    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    //Uncomment the following line preserve selection between presentations
    //Self.clearsSelectionOnViewWillAppear = false
    //Uncomment the following line to display an Edit button in the navigation bar for this view controller
    //self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
    }
    //MARK:- Table view data source
    /*
        override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            //Returen the number of sections.
        return 5
    }
    */
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
                let imagePicker = UIImagePickerController()
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .PhotoLibrary
                    imagePicker.delegate = self
                
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
        }
    
         tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
   
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func save() {
        //Form validation
        var errorField = ""
        
        if nameTextField.text == "" {
        errorField = "name"
        } else if locationTextField.text == "" {
            errorField = "location"
        } else if typeTextField.text == "" {
            errorField = "type"
        }
        
        if errorField != "" {
            let alertController = UIAlertController(title: "Oops", message:"We can't proceed as you forget to fill in the restaurant" + errorField + ".All fields are mandatory.", preferredStyle: .Alert)
            let doneAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(doneAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            return
        }
        //If all fields are correctly filled in, extract the field value
        println("Name: " + nameTextField.text)
        println("Type: " + typeTextField.text)
        println("Location:" + locationTextField.text)
        println("Have you been here: " + (isVisited ? "yes" : "no"))
        
        //Execute the unwind segue and go back to the home screen
        performSegueWithIdentifier("unwindToHomeScreen", sender: self)
        
            // If all fields are correctly filled in, extract the field value
        // Create Restaurant Object and save to data store
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext {
            
            restaurant = NSEntityDescription.insertNewObjectForEntityForName("Restaurant",
            inManagedObjectContext: managedObjectContext) as Restaurant
            restaurant.name = nameTextField.text
            restaurant.type = typeTextField.text
            restaurant.location = locationTextField.text
            restaurant.image = UIImagePNGRepresentation(imageView.image)
            restaurant.isVisited = isVisited
            //  restaurant.isVisited = NSNumber.convertFromBooleanLiteral(isVisited)
            
            var e: NSError?
            if managedObjectContext.save(&e) != true {
                println("insert error: \(e!.localizedDescription)")
                return
            }
        }
        
    }
    
    @IBAction func updateIsVisited(sender: AnyObject) {
        //Yes button clicked
        let buttonClicked = sender as UIButton
        if buttonClicked == yesButton {
            isVisited = true
            yesButton.backgroundColor = UIColor(red: 235.0/255.0, green: 73.0/255.0, blue: 27.0/255.0, alpha: 1.0)
            noButton.backgroundColor = UIColor.grayColor()
        } else if buttonClicked == noButton {
            isVisited = false
            yesButton.backgroundColor = UIColor.grayColor()
            noButton.backgroundColor = UIColor(red: 235.0/255.0, green: 73.0/255.0, blue: 27.0/255.0, alpha: 1.0)
        }
    }
    /*
    //MARK:- Navigation
    //In a storyboard-based applicatrion, you will often want to do a little preparation before navigation
    override func prepareFreForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    //Get the new controller using [segue destinationViewController].
        //Pass the selected object to new iew controller.
    }
    */
    
    func navigationController(navigationController: UINavigationController!, willShowViewController viewController: UIViewController, animated: Bool) {
        UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
    }
}
