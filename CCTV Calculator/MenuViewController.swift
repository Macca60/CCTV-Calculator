//
//  MenuViewController.swift
//  CCTV Calculator
//
//  Created by Kieron Mcdonough on 9/4/17.
//  Copyright © 2017 Kieron Mcdonough. All rights reserved.
//

import UIKit
import os.log
import SafariServices

// This view controllers gets the status of the feet, meters selector and pass it to the Viewcontroller.

class MenuViewController: UITableViewController, UITextFieldDelegate
{
    
    
        init(defaults:UserDefaults){
        super.init(nibName: nil, bundle: nil)
        
                                   }
    
        required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)             }
    
 
    @IBOutlet weak var DistConvert: UISwitch!
    
        
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
                               }
    
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
    
    
    @IBAction func Privacy(_ sender: Any) {
        
        showSafariVC(for: "https://protectyourhomecctv.blogspot.com/p/privacy-policy-i-built-cctv-storage.html")     }
    
    
    func showSafariVC(for url: String) {
        guard let url = URL(string: url)else{
            //Show error
            return
                                       }
        
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    
                                        }
      // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return 6
        }
    
    
}

        
 
