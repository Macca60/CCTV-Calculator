//
//  MenuViewController.swift
//  CCTV Calculator
//
//  Created by Kieron Mcdonough on 9/4/17.
//  Copyright © 2017 Kieron Mcdonough. All rights reserved.
//

import UIKit
import os.log

// This view controllers gets the status of the feet, meters selector and pass it to the Viewcontroller.

class MenuViewController: UIViewController, UIScrollViewDelegate
    
{
        init(defaults:UserDefaults){
        super.init(nibName: nil, bundle: nil)
        
                                   }
    
        required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)             }
    
    
    @IBOutlet var DistConvert: UISwitch!
    
 //   @IBOutlet weak var ScrollView: UIScrollView!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func DistConvert(_ sender: UISwitch) {
        
        if DistConvert.isOn{
            
            UserDefaults.standard.set(true, forKey: "Feet")
                           }
            
        else
            
        { UserDefaults.standard.set(false, forKey: "Feet")
    
        }
        
                                                    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DistConvert.isOn = UserDefaults.standard.bool(forKey: "Feet")
        
        func saveSwitchPressed(_ sender: UISwitch) {
            UserDefaults.standard.set(sender.isOn, forKey: "Feet")
                                                   }

        // Do any additional setup after loading the view.
        
      //  self.ScrollView.minimumZoomScale = 1.0
      //  self.ScrollView.maximumZoomScale = 2.1
      //  self.ScrollView.zoomScale = 1.0
      //  self.ScrollView.delegate=self
        
                                 }
    
   
   // func viewForZooming(in: UIScrollView) -> UIView? {
   // return self.image
   //                                                  }
    
   // func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat)
   // {
    //    self.ScrollView.maximumZoomScale = 1.0
    //    self.ScrollView.minimumZoomScale = 1.0
    //    self.ScrollView.zoomScale = 1.0
    //    self.ScrollView.maximumZoomScale = 1.2
     //   self.ScrollView.delegate=self
   // }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
                                            }
    
     func viewWillDisappear(_ animated: Bool, state1: Bool){
        
        DistConvert.isOn = UserDefaults.standard.bool(forKey: "Feet")
        
        
        func saveSwitchPressed(_ sender: UISwitch) {
    UserDefaults.standard.set(sender.isOn, forKey: "Feet")
                                                   }
        
                                                         }
}

        
 
