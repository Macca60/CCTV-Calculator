//
//  MenuViewController.swift
//  CCTV Calculator
//
//  Created by Kieron Mcdonough on 9/4/17.
//  Copyright © 2017 Kieron Mcdonough. All rights reserved.
//

import UIKit

class MenuViewController: UIMenuViewController {
    
    var Feet:Bool
    
    
  //  @IBOutlet var DistConvert: UISwitch!
    
    
    @IBAction func DistConvert(_ sender: Any) {
        
        
        if DistConvert.isOn {
        
           var Feet:Bool
           Feet = true          }
        
        else {Feet = false }

        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nslog()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
