//
//  CarDetailViewController.swift
//  car_catalogue_midterm_049
//
//  Created by Parinya Termkasipanich on 4/10/2565 BE.
//

import UIKit

class CarDetailViewController: UIViewController {
    
    var car_brand_select:Int = 0
    var car_model_select:Int = 0

    @IBOutlet weak var brandText: UILabel!
    @IBOutlet weak var ModelText: UILabel!
    @IBOutlet weak var ImageShow: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setDetail()
    }
    
    func setDetail() {
        brandText.text = car_brand[car_brand_select]
        ModelText.text = car_detail[car_brand_select][car_model_select]["model"]!
        ImageShow.image = UIImage(named: car_detail[car_brand_select][car_model_select]["detail_img"]!)
    }
    

    @IBAction func calculator_btn(_ sender: Any) {
        OpenCalculator()
    }
    
    func OpenCalculator(){
        guard let ModalVC = storyboard?.instantiateViewController(withIdentifier: "CalculatorViewController") as? CalculatorViewController else {return}
        //set show style
        ModalVC.modalPresentationStyle = .popover
        //required
        present(ModalVC, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
