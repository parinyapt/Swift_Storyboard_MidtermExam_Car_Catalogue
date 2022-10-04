//
//  Finance.swift
//  car_catalogue_midterm_049
//
//  Created by Parinya Termkasipanich on 4/10/2565 BE.
//

import UIKit

class Finance: NSObject {
    var value_setting:[Float] = [0,0,0]
    var installment_year_period:Int = 0 //ระยะเวลาผ่อน (ปี)
    
    func Calculate() -> (loan_amount:Float,payment_month_installment:Float) {
        var loan_amount:Float = 0
        var interest_per_year:Float = 0
        var interest_amount:Float = 0
        var payment_amount:Float = 0
        var payment_month_installment:Float = 0
        
        loan_amount = value_setting[0] - value_setting[1]
        interest_per_year = loan_amount * (value_setting[2] / 100)
        interest_amount = interest_per_year * Float(installment_year_period)
        payment_amount = loan_amount + interest_amount
        payment_month_installment = payment_amount / (Float(installment_year_period) * 12)
        
        return (loan_amount,payment_month_installment)
    }
}
