//
//  CalculatorViewController.swift
//  car_catalogue_midterm_049
//
//  Created by Parinya Termkasipanich on 4/10/2565 BE.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var Input_Interest_value:Float = 0
    var Input_year_select_value:Int = 2

    @IBOutlet weak var Input_vehicle_price: UITextField!
    @IBOutlet weak var Input_down_amount: UITextField!
    
    @IBOutlet weak var Output_interest_percent: UILabel!
    @IBOutlet weak var Output_loan_amount: UITextField!
    @IBOutlet weak var Output_payment_month_installment: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateBtn(_ sender: Any) {
        let finance = Finance()
        let validate = Validator()
        
        if validate.Decimal(text:String(Input_vehicle_price.text!),min:0) && validate.Decimal(text:String(Input_down_amount.text!),min:0) {
            finance.value_setting[0] = Float(Input_vehicle_price.text!)!
            finance.value_setting[1] = Float(Input_down_amount.text!)!
            finance.value_setting[2] = Input_Interest_value
            finance.installment_year_period = Input_year_select_value
            let result = finance.Calculate()
            Output_loan_amount.text = String(format:"%.2f",result.loan_amount)
            Output_payment_month_installment.text = String(format:"%.2f",result.payment_month_installment)
        }else {
            Output_loan_amount.text = "error"
            Output_payment_month_installment.text = "error"
        }
    }
    
    @IBAction func Input_Interest(_ sender: Any) {
        let s:UISlider = sender as! UISlider
        Input_Interest_value = Float(String(format: "%.2f", Float(s.value)))!
        Output_interest_percent.text = String(Input_Interest_value)
    }
    
    @IBAction func Input_year_period(_ sender: Any) {
        let s:UISegmentedControl = sender as! UISegmentedControl
        Input_year_select_value = (s.selectedSegmentIndex+2)
    }

}
