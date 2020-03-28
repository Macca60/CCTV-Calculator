//
//  ViewController.swift
//  CCTV Calculator
//
//  Created by Kieron Mcdonough on 9/3/17.
//  Copyright © 2017 Kieron Mcdonough. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{
    // Initialize..
    
    init(defaults:UserDefaults){
        super.init(nibName: nil, bundle: nil)}

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)             }
    
    
        override func viewDidLoad() {
            
            // Load Pixel Indicators and read UserDefaults for meter - Feet selection..
        
        super.viewDidLoad()
            
            //Looks for single or multiple taps.
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
            
            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false
            
            view.addGestureRecognizer(tap)
            
        DistToCam.delegate = self
        HorzDist.delegate = self
        
        self.PixelFaceIndicator.image = UIImage(named: "greydot")
        self.PixelNumPlate.image = UIImage(named: "greydot")
        self.PixelDetectIndicator.image = UIImage(named: "greydot")
            
        let state1 : Bool = UserDefaults.standard.bool(forKey: "Feet")
        
        switch state1
            
    // Switch to either feet or meters based on state1 status.
            
    {case true :
       FeetMtrLabel.text = "Meters"
       FeetMtrLabel2.text = "Meters"
       FetMtrLabel3.text = "Meters"
       PixelsPerMeter.text = "Pixels Per Meters:       "
        
        case false :
            
      FeetMtrLabel.text = "Feet"
      FeetMtrLabel2.text = "Feet"
      FetMtrLabel3.text = "Feet"
      PixelsPerMeter.text = "Pixels Per Feet:    "
    }
            
    // Set default Resolution and CCD format size..
            
    Resolution = 1280
    CCDFrmtMultiplier = 3.6
        
        // Do any additional setup after loading the view, typically from a nib.
            
       // Change text of Segment control to make more readable.
            
            let proxySegmentedControl = UISegmentedControl.appearance()
            proxySegmentedControl.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for: UIControlState.normal)
            proxySegmentedControl.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for: UIControlState.selected)
            
                                    }
    
    // Set Meters - feet selection when returning from Menu View and set values to zero..
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()        
        let state1 : Bool = UserDefaults.standard.bool(forKey: "Feet")
        
        if state1 == true
            
        {FeetMtrLabel.text = "Meters"
            FeetMtrLabel2.text = "Meters"
            FetMtrLabel3.text = "Meters"
            PixelsPerMeter.text = "Pixels Per Meter:    "
            FocalLength.text = "Lens required: "
            HorzAngleView.text = "Angle of view: "
        }
        else {FeetMtrLabel.text = "Feet"
            FeetMtrLabel2.text = "Feet"
            FetMtrLabel3.text = "Feet"
            PixelsPerMeter.text = "Pixels Per Feet:    "
            FocalLength.text = "Lens required: "
            HorzAngleView.text = "Angle of view: "        }
    }
    
    // Mark: Properties
    
   // @IBOutlet Definitions
    
    @IBOutlet weak var MyTap: UITapGestureRecognizer!
    
  
    @IBAction func MyTapGest(_ sender: UITapGestureRecognizer) {
    }
    
    @IBOutlet weak var FocalLength: UITextField!
    @IBOutlet weak var HorzDist: UITextField!
    @IBOutlet weak var DistToCam: UITextField!
    @IBOutlet weak var PixelsPerMeter: UITextField!
    @IBOutlet weak var HorzAngleView: UITextField!
    @IBOutlet weak var CamHeight: UITextField!
    @IBOutlet weak var FeetMtrLabel: UILabel!
    @IBOutlet weak var FeetMtrLabel2: UILabel!
    @IBOutlet weak var FetMtrLabel3: UILabel!
    @IBOutlet weak var SensSegmentedCtrl: UISegmentedControl!
    
    //IBAction functions
    
    @IBOutlet weak var HorzontalDist2: UISlider!
    
    @IBAction func DistCamSelector(_ sender: UISlider) {
        
    DistToCam.text = String (Int(sender.value))
                                                       }
   
    @IBAction func HorzDistSelector(_ sender: UISlider) {
        HorzDist.text = String (Int(sender.value))
                                                        }
    
    @IBAction func CamHeightSelector(_ sender: UISlider) {
       CamHeight.text = String (Int(sender.value))
    }
    
    // Display Indictors - Detect- Recognition - Identification
    
    @IBOutlet var PixelFaceIndicator: UIImageView!
    @IBOutlet var PixelNumPlate: UIImageView!
    @IBOutlet weak var PixelDetectIndicator: UIImageView!
    
    // Default CCD Format Multiplier, multiplier is used in focal length calculation
    
    var CCDFrmtMultiplier : Double = 3.6
    var CCDFrmtMultiplier2 : Double = 2.7
    var Resolution : Double = 720
    
    
    // Select CCD Format Multiplier from Segmented control functions..
    
    @IBAction func QtrInch(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex   {
            
            case 0 : CCDFrmtMultiplier = 3.6
                     CCDFrmtMultiplier2 = 2.7
            case 1 : CCDFrmtMultiplier = 4.8
                     CCDFrmtMultiplier2 = 3.6
            case 2 : CCDFrmtMultiplier = 6.4
                     CCDFrmtMultiplier2 = 4.8
        default :    CCDFrmtMultiplier = 1.0
                     CCDFrmtMultiplier2 = 1.0        }
        
      //  let button = UIButton()
     //   self.Calculate(button)
                                                        }

    @IBAction func SelectedResolution(_ sender: UISegmentedControl) {
        
            switch sender.selectedSegmentIndex {
        
           case 0 : Resolution = 1280
           case 1 : Resolution = 1920
           case 2 : Resolution = 3840
          default : Resolution = 1
          }
        
       //    let button = UIButton()
      //    self.Calculate(button)
    }
    
    
    // Mark UiTextFieldDelegate
    
    
  
   // func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
   //     textField.resignFirstResponder()
    //    return true
                                                           //      }
    //
   // func textFieldDidEndEditing(_ textField: UITextField) {
        
        
       //    }
    
     @objc func dismissKeyboard(sender:UIGestureRecognizer) {view.endEditing(true) }
    
    
    // dismiss keyboard on touch outside textfield
   // override func touchesBegan(_ touches: Set<UITouch>, with event: ////UIEvent?) {
    //    for txt in self.view.subviews {
      //      if txt.isKind(of: UITextField.self) && txt.isFirstResponder {
       //         txt.resignFirstResponder()
                                           //                             }
                                  //    }
                                                                              //}
    // Mark Actions
    
    // Check for a Zero or NIL entry
    
    @IBAction func Calculate(_ sender: UIButton) {
        
        let DistToCamInt: Double? =  Double (DistToCam.text!)
        let HorzDistInt : Double? =  Double (HorzDist.text!)
        let CamHeightInt : Double? = Double (CamHeight.text!)
        
        func InputCheck(){
            let Alert = UIAlertController(title: "Invalid input", message: "Must be greater than 0", preferredStyle: UIAlertControllerStyle.alert)
            
            Alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in print("Click of cancel button")
                                                                                      }))
            self.present(Alert, animated: true, completion: nil)
            
                        }
        
        switch DistToCamInt {
        case nil : InputCheck()
            return
        case 0? : InputCheck()
            return
            
        default :
            break
                            }
        
        switch HorzDistInt {
        case nil: InputCheck()
            return
        case 0? : InputCheck()
            return
            
        default :
            break
                           }
        
        switch CamHeightInt {
        case nil: InputCheck()
            return
            
        case 0? : InputCheck()
            return
        default :
            break
                            }
        
        _ = Calculate2()
                                                 }
    
    // Calculate button calculates Focal length, Horizontal view and Pixels per meter.
    
        func Calculate2() -> (HorzDistInt:Double?, PixelPerMeter2: Double)        {
        let state = UserDefaults.standard.bool(forKey: "Feet")
          
            let DistToCamInt: Double? =  Double (DistToCam.text!)
            let HorzDistInt : Double? =  Double (HorzDist.text!)
            let CamHeightInt : Double? = Double (CamHeight.text!)
        
        // Calculate Focal length and Angle of view..
   
        let FocalLenghtResult = round(10*((CCDFrmtMultiplier * sqrt(Double(DistToCamInt! * DistToCamInt!) + (CamHeightInt! * CamHeightInt!))) / Double(HorzDistInt!)))/10
        let HorzAngleViewRad  = 2.0 * (atan ((CCDFrmtMultiplier/2.0) / FocalLenghtResult))
        let HorzAngleViewDeg = round(10 * HorzAngleViewRad * 180/3.142)/10
        
        let VertAngleViewRad  = 2.0 * (atan (CCDFrmtMultiplier2/(2.0 * FocalLenghtResult)))
        let VertAngleViewDeg = round(10 * (VertAngleViewRad * 180/3.142))/10
        print(VertAngleViewDeg)
            
    // Display result.
        
        FocalLength.text = "Lens required: \(FocalLenghtResult) mm"
    
        HorzAngleView.text = "Angle of view: Horz: \(HorzAngleViewDeg)°"
        
    // Calculate Pixels per Meter..
        
    let PixelPerMeter2 =  round(10 * (Resolution/Double (HorzDistInt!)))/10
    
    switch state {
    
    case true : PixelsPerMeter.text = "Pixels Per meter: \(PixelPerMeter2)"
        
    let image1 = UIImage(named: "greendot")
    let image2 = UIImage(named: "reddot")
    
    // *** FOR METERS ***
    // For Pixels < 60 no indication
    // For Pixels > 60 < 150 Detect indication
    // For Pixels > 150 < 500 recognition
    // For Pixels > 500 < 1000 identification
    
    print (PixelPerMeter2)
    
            switch PixelPerMeter2 {
        
            case 1...59 :
        
                    //No detection
        
                    self.PixelFaceIndicator.image = image2;
                    self.PixelNumPlate.image = image2;
                    self.PixelDetectIndicator.image = image2
            case 59...149 :
        
                    //Detection
        
                    self.PixelFaceIndicator.image = image2;
                    self.PixelNumPlate.image = image2;
                    self.PixelDetectIndicator.image = image1
            case 149...499 :
        
                    //Recogniton
        
                    self.PixelFaceIndicator.image = image2;
                    self.PixelNumPlate.image = image1;
                    self.PixelDetectIndicator.image = image1
            case 499...1000 :
        
                    //Identification
        
                    self.PixelFaceIndicator.image = image1;
                    self.PixelNumPlate.image = image1;
                    self.PixelDetectIndicator.image = image1
            default :
                    self.PixelFaceIndicator.image = image1;
                    self.PixelNumPlate.image = image1;
                    self.PixelDetectIndicator.image = image1
                }
        
        
    case false : PixelsPerMeter.text = "Pixels Per foot: \(PixelPerMeter2)"
        
    let image1 = UIImage(named: "greendot")
    let image2 = UIImage(named: "reddot")
    
    // *** FOR FEET     ***
    // For Pixels < 18 no indication
    // For Pixels > 18 < 46 Detect indication
    // For Pixels > 46 < 153 Face indication
    // For Pixels > 153 < 305 Identification
    
    //Meters to Feet
    // 60/3.28 Detect= 18
    // 150/3.28 Recognition = 46
    //500/3.28 Identification = 153
    
    
                switch PixelPerMeter2 {
        
                case 1...18 :
        
                        //No detection
        
                        self.PixelFaceIndicator.image = image2;
                        self.PixelNumPlate.image = image2;
                        self.PixelDetectIndicator.image = image2
                case 18...46 :
        
                        //Detection
        
                        self.PixelFaceIndicator.image = image2;
                        self.PixelNumPlate.image = image2;
                        self.PixelDetectIndicator.image = image1
                case 46...153 :
        
                        //Recogniton
        
                        self.PixelFaceIndicator.image = image2;
                        self.PixelNumPlate.image = image1;
                        self.PixelDetectIndicator.image = image1
                case 153...3280 :
        
                        //Identification
        
                        self.PixelFaceIndicator.image = image1;
                        self.PixelNumPlate.image = image1;
                        self.PixelDetectIndicator.image = image1
                default :
                        self.PixelFaceIndicator.image = image1;
                        self.PixelNumPlate.image = image1;
                        self.PixelDetectIndicator.image = image1
                                }
    }
        return (HorzDistInt!, PixelPerMeter2)
        
           //override func didReceiveMemoryWarning() {
           //  super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
           //}
                  }
    
    // Below allows the user to click the Identification/Recogniton/Detect properties buttons to set the camera distance to achieve each of the properties.
    
    @IBAction func Identification(_ sender: UIButton) {
    
    let state1 : Bool = UserDefaults.standard.bool(forKey: "Feet")
        
        // Check for 0 or nil
        
        func InputAlert(){
            let Alert = UIAlertController(title: "Invalid input", message: "Must be greater than 0", preferredStyle: UIAlertControllerStyle.alert)
            
            Alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in print("Click of cancel button")}))
            
            self.present(Alert, animated: true, completion: nil)
            
            return
        
                         }
    
            let DistToCamInt: Double? =  Double (DistToCam.text!)
            let HorzDistInt : Double? =  Double (HorzDist.text!)
            let CamHeightInt : Double? = Double (CamHeight.text!)
        
            switch DistToCamInt {
            case nil : InputAlert()
                return
            case 0? : InputAlert()
                return
                
            default :
                break
            }
            
            switch HorzDistInt {
            case nil: InputAlert()
                return
            case 0? : InputAlert()
                return
                
            default :
                break
            }
            
            switch CamHeightInt {
            case nil: InputAlert()
                return
                
            case 0? : InputAlert()
                return
            default :
                break
            }
        
        // Set the Horizontal distance based on identification
        
   // For Meters
        
    if state1 == true {
        
        HorzDist.text =  String(round ((Resolution/504.0)*10)/10)
        
        HorzontalDist2.value = (Float(Resolution/504.0))
    
    _ = Calculate2()
    
                      }
    else
        
   //For Feet 153
                      {
   
   HorzDist.text =  String(round ((Resolution/157.0)*10)/10)
   HorzontalDist2.value = (Float(Resolution/157.0))
   
  _ = Calculate2()
                        
                      }
                                                    }

    @IBAction func Recognition(_ sender: UIButton) {
        
        let state1 : Bool = UserDefaults.standard.bool(forKey: "Feet")
        
           // Check for 0 or nil
        
        func InputAlert(){
            let Alert = UIAlertController(title: "Invalid input", message: "Must be greater than 0", preferredStyle: UIAlertControllerStyle.alert)
            
            Alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in print("Click of cancel button")}))
            
            self.present(Alert, animated: true, completion: nil)
            
            return
            
        }
        
        let DistToCamInt: Double? =  Double (DistToCam.text!)
        let HorzDistInt : Double? =  Double (HorzDist.text!)
        let CamHeightInt : Double? = Double (CamHeight.text!)
        //if DistToCamInt == nil {InputCheck()}
        switch DistToCamInt {
        case nil : InputAlert()
            return
        case 0? : InputAlert()
            return
            
        default :
            break
        }
        
        switch HorzDistInt {
        case nil: InputAlert()
            return
        case 0? : InputAlert()
            return
            
        default :
            break
        }
        
        switch CamHeightInt {
        case nil: InputAlert()
            return
            
        case 0? : InputAlert()
            return
        default :
            break
        }
        
        // Set the Horizontal distance based on Recognition
        
        // For Meters 150
        if state1 == true {
            HorzDist.text =  String(round ((Resolution/150.0)*10)/10)
            
            HorzontalDist2.value = (Float(Resolution/150.0))
            _ =  Calculate2()
            print("meters")
        }
        else
            //For Feet 46
        {
            HorzDist.text =  String(round ((Resolution/49.0)*10)/10)
            HorzontalDist2.value = (Float(Resolution/49.0))
            _ =   Calculate2()
            print("Feet")
        }
        
    }
    
    
    @IBAction func Detection(_ sender: UIButton) {
        
        let state1 : Bool = UserDefaults.standard.bool(forKey: "Feet")
        
           // Check for 0 or nil
        
        func InputAlert(){
            let Alert = UIAlertController(title: "Invalid input", message: "Must be greater than 0", preferredStyle: UIAlertControllerStyle.alert)
            
            Alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in print("Click of cancel button")}))
            
            self.present(Alert, animated: true, completion: nil)
            
            return
            
        }
        
        let DistToCamInt: Double? =  Double (DistToCam.text!)
        let HorzDistInt : Double? =  Double (HorzDist.text!)
        let CamHeightInt : Double? = Double (CamHeight.text!)
        //if DistToCamInt == nil {InputCheck()}
        switch DistToCamInt {
        case nil : InputAlert()
            return
        case 0? : InputAlert()
            return
            
        default :
            break
        }
        
        switch HorzDistInt {
        case nil: InputAlert()
            return
        case 0? : InputAlert()
            return
            
        default :
            break
        }
        
        switch CamHeightInt {
        case nil: InputAlert()
            return
            
        case 0? : InputAlert()
            return
        default :
            break
        }
        
        // Set the Horizontal distance based on detection
        
        // For Meters
        if state1 == true {
            HorzDist.text =  String(round ((Resolution/60.0)*10)/10)
            
            HorzontalDist2.value = (Float(Resolution/60.0))
            _ =  Calculate2()
            print("meters")
        }
        else
            //For Feet 18
        {
            HorzDist.text =  String(round ((Resolution/20.0)*10)/10)
            HorzontalDist2.value = (Float(Resolution/20.0))
            _ =   Calculate2()
            print("Feet")
        }
        
    }
    
}
