//
//  TextFieldMaxLengths.swift
//  CCTV Calculator
//
//  Created by Kieron Mcdonough on 7/12/17.
//  Copyright © 2017 Kieron Mcdonough. All rights reserved.
//

import Foundation
import UIKit

// 1
private var maxLengths = [UITextField: Int]()

extension UITextField {
    
    // 3
    @IBInspectable var maxLength: Int {
        get {
            // 4
          guard let length = maxLengths[self] else {
               return Int.max
           }
            return length
        }
        set {
            maxLengths[self] = newValue
            // 5
            addTarget(
                self,
                action: #selector(limitLength),
                for: UIControlEvents.editingChanged
            )
        }
    }
    
    @objc func limitLength(textField: UITextField) {

        // 6
        guard let prospectiveText = textField.text,
            prospectiveText.count > maxLength
            else {
                return
        }
        
        let selection = selectedTextRange
        // 7
    let maxCharIndex = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
        text = String(prospectiveText[..<maxCharIndex])
        selectedTextRange = selection
   }
    
}
