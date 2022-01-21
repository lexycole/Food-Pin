//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by IOS Developer on 11/23/21.
//  Copyright (c) 2021 AppCoda. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet weak var backgroundImageView:UIImageView!
    @IBOutlet weak var dialogView:UIView!
    
    
    override func viewDidLoad() {
    
    var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
    var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
    
        //Combining Two Transforms
        let scale = CGAffineTransformMakeScale(0.0, 0.0)
        let translate = CGAffineTransformMakeTranslation(0, 500)
        
        dialogView.transform = CGAffineTransformConcat(scale, translate)
        
        dialogView.transform = CGAffineTransformMakeScale(0.0, 0.0)
        dialogView.transform = CGAffineTransformMakeTranslation(0, 500)
        }
    
    override func viewDidAppear(animated: Bool) {
        //Combime two transform
//        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: {
//            let scale = CGAffineTransformMakeScale(1, 1)
//            let translate = CGAffineTransformMakeTranslation(0, 0)
//            self.dialogView.transform = CGAffineTransformConcat(scale, translate)
//            }, completion: nil)
        
//  UIView.animateWithDuration(0.7,  delay: 0.0, options: nil, animations: {
//            self.dialogView.transform = CGAffineTransformMakeScale(1, 1)
//        }, completion: nil)
//
        // Spring Animation
        UIView.animateWithDuration(0.7,  delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: {
            self.dialogView.transform = CGAffineTransformMakeScale(1, 1)
            }, completion: nil)
//
//        // Slide UP Animation
//        UIView.animateWithDuration(0.7,  delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: {
//            self.dialogView.transform = CGAffineTransformMakeTranslation(0, 0)
//            }, completion: nil)
        }
    
    }
