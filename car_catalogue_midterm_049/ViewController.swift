//
//  ViewController.swift
//  car_catalogue_midterm_049
//
//  Created by Parinya Termkasipanich on 4/10/2565 BE.
//

import UIKit

class ViewController: UIViewController {

    
    let title_config:String = "Car Gallery"
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TitleLabel.text = title_config
    }

    @IBAction func toyota_btn(_ sender: Any) {
        OpenCarList(brandID:0)
    }
    
    @IBAction func nissa_btn(_ sender: Any) {
        OpenCarList(brandID:1)
    }
    
    @IBAction func mazda_btn(_ sender: Any) {
        OpenCarList(brandID:2)
    }
    
    @IBAction func honda_btn(_ sender: Any) {
        OpenCarList(brandID:3)
    }
    
    @IBAction func calculator_btn(_ sender: Any) {
        OpenCalculator()
    }
    
    func OpenCarList(brandID:Int){
        guard let ModalVC = storyboard?.instantiateViewController(withIdentifier: "CarListViewController") as? CarListViewController else {return}
        //set show style
        ModalVC.modalPresentationStyle = .popover
        
        ModalVC.car_brand_select = brandID
        //required
        present(ModalVC, animated: true)
    }
    
    func OpenCalculator(){
        guard let ModalVC = storyboard?.instantiateViewController(withIdentifier: "CalculatorViewController") as? CalculatorViewController else {return}
        //set show style
        ModalVC.modalPresentationStyle = .popover
        //required
        present(ModalVC, animated: true)
    }
}

