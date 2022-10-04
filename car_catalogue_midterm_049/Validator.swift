//
//  Validator.swift
//  car_catalogue_midterm_049
//
//  Created by Parinya Termkasipanich on 4/10/2565 BE.
//

import UIKit

class Validator: NSObject {
    func Decimal(text:String,min:Double? = nil,max:Double? = nil) -> Bool {
        
        if Double(text) != nil {
          //check min max
          if ((min != nil && Double(text)! >= min!) || min == nil) && ((max != nil && Double(text)! <= max!) || max == nil) {
              return true
          }
        }
        return false
    }
}
