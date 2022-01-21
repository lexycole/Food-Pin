//
//  AboutViewController.swift
//  FoodPin
//
//  Created by IOS Developer on 11/30/21.
//  Copyright (c) 2021 AppCoda. All rights reserved.
//

import UIKit
import MessageUI

class AboutViewController: UIViewController, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendEmail (sender: AnyObject) {
        if MFMailComposeViewController.canSendMail() {
            var composer = MFMailComposeViewController()
            
            composer.mailComposeDelegate = self
            composer.setToRecipients(["support@appcoda.com"])
            composer.navigationBar.tintColor = UIColor.whiteColor()
            
            //            presentViewController(composer, animated: true, completion: nil)
            presentViewController(composer, animated: true, completion: {
                
                UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
                
                //setStatusBarStyle:UIStatusBarStyleLightContent];
                
            })
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        
        switch result.value {
        case MFMailComposeResultCancelled.value:
            println("Mail cancelled")
            
        case MFMailComposeResultSaved.value:
            println("Mail saved")
            
        case MFMailComposeResultSent.value:
            println("Mail sent")
            
        case MFMailComposeResultFailed.value:
            println("Failed to send mail: \(error.localizedDescription)")
            
        default:
            break
        }
        
        // Dismiss the Mail interface
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
