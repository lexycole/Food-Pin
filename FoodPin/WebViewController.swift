//
//  WebViewController.swift
//  FoodPin
//
//  Created by IOS Developer on 11/30/21.
//  Copyright (c) 2021 AppCoda. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView:UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load web content
        if let url = NSURL(string: "http://www.appcoda.com") {
            let request = NSURLRequest(URL: url)
            webView.loadRequest(request)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
