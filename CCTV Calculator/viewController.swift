//
//  ViewController.swift
//  CCTV Calculator
//
//  Created by Kieron Mcdonough on 9/3/17.
//  Copyright © 2017 Kieron Mcdonough. All rights reserved.
//

import UIKit

class viewController: UITableViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate
{
    // Initialize..
    
    init(defaults:UserDefaults){
        super.init(nibName: nil, bundle: nil)}

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)             }
    
    
    
    
  //  private let greenView = UIView()
    
       override func viewDidLoad() {
            
    //        if #available(iOS 11.0, *) {
     //           additionalSafeAreaInsets.bottom = 84.0
     //           print("bottom inset")
      //                                 }
      //      else {
                // Fallback on earlier versions
       //                     }
          
            
            
            
            
            // Load Pixel Indicators and read UserDefaults for meter - Feet selection..
        
        super.viewDidLoad()
            
            CreateDataPicker()
            CreateToolBar()
            pickerView.dataSource = self
            pickerView.delegate = self
            
            SensorSizeDisplay.text = "1/3"
            ResolutionSelectDisplay.text = "1080p"
            PickerData1Value = pickerData1Value[1]
            PickerData2Value = pickerData2Value[1]
            
            
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
       FeetMtrLabel.text = "meters"
       FeetMtrLabel2.text = "meters"
       FetMtrLabel3.text = "meters"
       PixelPerMater.text = "Pixels Per Meters:       "
        
        case false :
            
      FeetMtrLabel.text = "feet"
      FeetMtrLabel2.text = "feet"
      FetMtrLabel3.text = "feet"
      PixelPerMater.text = "Pixels Per Feet:    "
    }
            
    // Set default Resolution and CCD format size..
            
    //Resolution = 1280
  //  CCDFrmtMultiplier = 3.6
        
        // Do any additional setup after loading the view, typically from a nib.
            
       // Change text of Segment control to make more readable.
            
      //      let proxySegmentedControl = UISegmentedControl.appearance()
      //      proxySegmentedControl.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for: UIControlState.normal)
      //      proxySegmentedControl.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for: UIControlState.selected)
            
                                    }
    
    // Set Meters - feet selection when returning from Menu View and set values to zero..
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        
       //   var safeAreaBottom: CGFloat = 10.0
        //      if #available(iOS 11.0, *) {
        //          safeAreaBottom = UIApplication.shared.keyWindow!.safeAreaInsets.bottom
        //      }

          //    tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0.0);
              
        
        
        let state1 : Bool = UserDefaults.standard.bool(forKey: "Feet")
        
        if state1 == true
            
        {FeetMtrLabel.text = "meters"
            FeetMtrLabel2.text = "meters"
            FetMtrLabel3.text = "meters"
            PixelPerMater.text = "Pixels Per Meter:    "
            FocalLength.text = "Lens required: "
            HorzAngleView.text = "Angle of view: "
        }
        else {FeetMtrLabel.text = "feet"
            FeetMtrLabel2.text = "feet"
            FetMtrLabel3.text = "feet"
            PixelPerMater.text = "Pixels Per Feet:    "
            FocalLength.text = "Lens required: "
            HorzAngleView.text = "Angle of view: "        }
    }
    
    // Mark: Properties
    
   // @IBOutlet Definitions
    
  //  @IBOutlet weak var MyTap: UITapGestureRecognizer!
    
  
   // @IBAction func MyTapGest(_ sender: UITapGestureRecognizer) {
   // }
    
    @IBOutlet weak var FocalLength: UITextField!
    @IBOutlet weak var HorzDist: UITextField!
    @IBOutlet weak var DistToCam: UITextField!
    
  //  @IBOutlet weak var PixelsPerMeter: UITextField!
    
    @IBOutlet weak var PixelPerMater: UITextField!
    
    @IBOutlet weak var HorzAngleView: UITextField!
    @IBOutlet weak var CamHeight: UITextField!
    @IBOutlet weak var FeetMtrLabel: UILabel!
    @IBOutlet weak var FeetMtrLabel2: UILabel!
    @IBOutlet weak var FetMtrLabel3: UILabel!
    
    @IBOutlet weak var SensorSize: UIPickerView!
    @IBOutlet weak var ResolutionSelect: UIPickerView!
    
    @IBOutlet weak var SensorSizeDisplay: UITextField!
    @IBOutlet weak var ResolutionSelectDisplay: UITextField!
    
  //  @IBOutlet weak var SensSegmentedCtrl: UISegmentedControl!
    
    //IBAction functions
    
  //   @IBOutlet weak var HorzontalDist2: UISlider!
        
      //    @IBAction func DistCamSelector(_ sender: UISlider)
    
  //  @IBOutlet weak var HorzontalDist2: UISlider!
    
    
    @IBOutlet weak var HorzontalDist2: UISlider!
    
   
    @IBAction func DistCamSelector(_ sender: UISlider) {
        
        DistToCam.text = String (Int(sender.value))
        
         }
    
    
  //  @IBAction func HorzDistSelector(_ sender: UISlider) {
    
    
   //     HorzDist.text = String (Int(sender.value))
                                                        //}
    
    @IBAction func HorzDistSelector(_ sender: UISlider) {
        
         HorzDist.text = String (Int(sender.value))
    }
    
    
    @IBAction func CamHeightSelector(_ sender: UISlider) {
    
    
       CamHeight.text = String (Int(sender.value))
    }
    
    // Display Indictors - Detect- Recognition - Identification
    
    
    
    @IBOutlet weak var PixelFaceIndicator: UIImageView!
    @IBOutlet weak var PixelNumPlate: UIImageView!
    @IBOutlet weak var PixelDetectIndicator: UIImageView!
    
    
    // Default CCD Format Multiplier, multiplier is used in focal length calculation
    
    var CCDFrmtMultiplier : Double = 4.8
    var CCDFrmtMultiplier2 : Double = 2.7
    var Resolution : Double = 1080
    
    
    // Select CCD Format Multiplier from Segmented control functions..
    
    @IBAction func QtrInch(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex   {
            
            // 1/4" = 3.2
            case 0 : CCDFrmtMultiplier = 3.6
                     CCDFrmtMultiplier2 = 2.7
            //1/3" = 4.8
            case 1 : CCDFrmtMultiplier = 4.8
                     CCDFrmtMultiplier2 = 3.6
            // 1/2" = 6.4
            case 2 : CCDFrmtMultiplier = 6.4
                     CCDFrmtMultiplier2 = 4.8
            // 3.2 for 1/4" Sensor *
            // 7.2(7.18) for 1/1.8"
            // xx for 1/2.8"
            // 4.98 for 1/2.9"
            // 5.8 (5.76)for 1/2.5"
            
            
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
    
    @objc func DismissKeyboard(){view.endEditing(true)    }
    
    var CurrentTextField = UITextField()
    var PickerData1Value = String()
    var PickerData2Value = String()
    var pickerView = UIPickerView()
    
    func CreateToolBar() {
    
    let toolbar = UIToolbar()
    toolbar.sizeToFit()
    let donebutton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(viewController.DismissKeyboard))
    toolbar.setItems(([donebutton]), animated: false)
    toolbar.isUserInteractionEnabled = true
    print("toolbar")
    
    SensorSizeDisplay.inputAccessoryView = toolbar
    ResolutionSelectDisplay.inputAccessoryView = toolbar
    HorzDist.inputAccessoryView = toolbar
    DistToCam.inputAccessoryView = toolbar
    CamHeight.inputAccessoryView = toolbar
        
    }
    
    
     func CreateDataPicker()  {
           
           let DataPicker = UIPickerView()
           DataPicker.delegate = self
           SensorSizeDisplay.inputView = DataPicker
           ResolutionSelectDisplay.inputView = DataPicker
                              }
       
       // Input data into the lens and resolution Selection Array:
    
    // Lens Size Display
       let pickerData = ["1/4","1/3","1/2.9","1/2.5", "1/2", "1/1.8"]
    
    
    //,"HD720(1280x720)",  "HD1080(1920x1080)", "3M(2048x1536)", "5M(2592x1944)", "4K(3840x2160)"]
    
    // Resolution Display
       let pickerData2 = ["720p (1280x720)","1080p (1920x1080)", "3MP (2048x1536)", "3072x1728 (5MP)", "4K (3840x2160"]
      
    // Lens Data 1/4 3.6 or 3.2
       let pickerData1Value = ["3.2","4.8","4.98","5.76","6.4","7.18"]
    // Resolution Data
       let pickerData2Value = ["1280","1920","2048", "3072", "3840"]
      
       
       // The number of columns of data
       
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
                                                                   }
       // The number of rows of data
    
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           
           if CurrentTextField == SensorSizeDisplay {
            return pickerData.count}
           else if CurrentTextField == ResolutionSelectDisplay { return pickerData2.count}
           else {return 0}
                                                                                                   }
       // The data to return for the row and component (column) that's being passed in
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           
           if CurrentTextField == SensorSizeDisplay { return pickerData[row]}
           else if CurrentTextField == ResolutionSelectDisplay { return pickerData2[row]}
           else {return ""}
                                                                                                                  }
       
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           
           if CurrentTextField == SensorSizeDisplay {SensorSizeDisplay.text = pickerData[row]
               PickerData1Value = pickerData1Value[row]
                                                     }
           else if CurrentTextField == ResolutionSelectDisplay { ResolutionSelectDisplay.text = pickerData2[row]
                PickerData2Value = pickerData2Value[row]
                                                               }
           
                                                                                                     }
    // Mark UiTextFieldDelegate
    
       // Text Field Delegate used
     
     func textFieldDidBeginEditing(_ textField: UITextField) {
         self.pickerView.delegate = self
         self.pickerView.dataSource = self
        textField.delegate = self
         CurrentTextField = textField
         if CurrentTextField == SensorSizeDisplay{
            CurrentTextField.inputView = pickerView}
         else if CurrentTextField == ResolutionSelectDisplay{ CurrentTextField.inputView = pickerView}
         
         
     }
    
  
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
            let Alert = UIAlertController(title: "Invalid input", message: "Must be greater than 0", preferredStyle: UIAlertController.Style.alert)
            
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
            let PickerData1ValueDouble : Double? = Double (PickerData1Value)
            let PickerData2ValueDouble : Double? = Double (PickerData2Value)
        // Calculate Focal length and Angle of view..
            
        let FocalLengthResultPart = PickerData1ValueDouble! * sqrt(Double(DistToCamInt! * DistToCamInt!))
        let FocalLenghtResult = round(10*((FocalLengthResultPart + (CamHeightInt! * CamHeightInt!)) / Double(HorzDistInt!)))/10
        let HorzAngleViewRad  = 2.0 * (atan ((PickerData1ValueDouble!/2.0) / FocalLenghtResult))
        let HorzAngleViewDeg = round(10 * HorzAngleViewRad * 180/3.142)/10
        
        let VertAngleViewRad  = 2.0 * (atan (PickerData1ValueDouble!/(2.0 * FocalLenghtResult)))
        let VertAngleViewDeg = round(10 * (VertAngleViewRad * 180/3.142))/10
        print(VertAngleViewDeg)
            
    // Display result.
        
        FocalLength.text = "Lens required: \(FocalLenghtResult) mm"
    
        HorzAngleView.text = "Angle of view: Horz: \(HorzAngleViewDeg)°"
        
    // Calculate Pixels per Meter..
        
    let PixelPerMeter2 =  round(10 * (PickerData2ValueDouble!/Double (HorzDistInt!)))/10
    
    switch state {
    
    case true : PixelPerMater.text = "Pixels Per meter: \(PixelPerMeter2)"
        
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
        
        
    case false : PixelPerMater.text = "Pixels Per foot: \(PixelPerMeter2)"
        
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
        
        print ("indent pressed")
    
    let state1 : Bool = UserDefaults.standard.bool(forKey: "Feet")
     let PickerData2ValueDouble : Double? = Double (PickerData2Value)
        // Check for 0 or nil
        
        func InputAlert(){
            let Alert = UIAlertController(title: "Invalid input", message: "Must be greater than 0", preferredStyle: UIAlertController.Style.alert)
            
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
        
        HorzDist.text =  String(round ((PickerData2ValueDouble!/504.0)*10)/10)
        
        HorzontalDist2.value = (Float(Resolution/504.0))
    
    _ = Calculate2()
    
                      }
    else
        
   //For Feet 153
                      {
   
   HorzDist.text =  String(round ((PickerData2ValueDouble!/157.0)*10)/10)
   HorzontalDist2.value = (Float(Resolution/157.0))
   
  _ = Calculate2()
                        
                      }
                                                    }
    
    @IBAction func Recognition(_ sender: UIButton) {
    
        let state1 : Bool = UserDefaults.standard.bool(forKey: "Feet")
        let PickerData2ValueDouble : Double? = Double (PickerData2Value)
        
           // Check for 0 or nil
        
        func InputAlert(){
            let Alert = UIAlertController(title: "Invalid input", message: "Must be greater than 0", preferredStyle: UIAlertController.Style.alert)
            
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
            HorzDist.text =  String(round ((PickerData2ValueDouble!/150.0)*10)/10)
            
            HorzontalDist2.value = (Float(PickerData2ValueDouble!/150.0))
            _ =  Calculate2()
            print("meters")
        }
        else
            //For Feet 46
        {
            HorzDist.text =  String(round ((PickerData2ValueDouble!/49.0)*10)/10)
            HorzontalDist2.value = (Float(PickerData2ValueDouble!/49.0))
            _ =   Calculate2()
            print("Feet")
        }
        
    }
    
    @IBAction func Detection(_ sender: UIButton) {
    
    
        let state1 : Bool = UserDefaults.standard.bool(forKey: "Feet")
        let PickerData2ValueDouble : Double? = Double (PickerData2Value)
        
           // Check for 0 or nil
        
        func InputAlert(){
            let Alert = UIAlertController(title: "Invalid input", message: "Must be greater than 0", preferredStyle: UIAlertController.Style.alert)
            
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
            HorzDist.text =  String(round ((PickerData2ValueDouble!/60.0)*10)/10)
            
            HorzontalDist2.value = (Float(PickerData2ValueDouble!/60.0))
            _ =  Calculate2()
            print("meters")
        }
        else
            //For Feet 18
        {
            HorzDist.text =  String(round ((PickerData2ValueDouble!/20.0)*10)/10)
            HorzontalDist2.value = (Float(PickerData2ValueDouble!/20.0))
            _ =   Calculate2()
            print("Feet")
        }
        
    }
    
      // MARK: - Table view data source

      override func numberOfSections(in tableView: UITableView) -> Int {
          // #warning Incomplete implementation, return the number of sections
          return 1
      }

      override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          // #warning Incomplete implementation, return the number of rows
          return 14
      }
    
}
