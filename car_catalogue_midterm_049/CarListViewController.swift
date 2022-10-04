//
//  CarListViewController.swift
//  car_catalogue_midterm_049
//
//  Created by Parinya Termkasipanich on 4/10/2565 BE.
//

import UIKit

class CarListViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    var car_brand_select:Int = 0
    var car_model_select:Int = 0
    
    @IBOutlet weak var ImageShow: UIImageView!
    @IBOutlet weak var CarListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        CarListView.dataSource = self
        CarListView.delegate = self
        
        setBannerImage(imgName:car_logo[car_brand_select])
    }
    
    @IBAction func ShowDetailBtn(_ sender: Any) {
        OpenCarDetail(brandID:car_brand_select,modelID:car_model_select)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return car_detail[car_brand_select].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarListCell_ID", for: indexPath)
        
        if indexPath.row % 2 == 0{
            cell.backgroundColor = UIColor.orange
        }
        
        cell.textLabel?.text = car_detail[car_brand_select][indexPath.row]["model"]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        car_model_select = indexPath.row
        setBannerImage(imgName:car_detail[car_brand_select][car_model_select]["car_img"]!)
    }
    
    func setBannerImage(imgName:String) {
        ImageShow.image = UIImage(named: imgName)
    }
    
    func OpenCarDetail(brandID:Int,modelID:Int){
        guard let ModalVC = storyboard?.instantiateViewController(withIdentifier: "CarDetailViewController") as? CarDetailViewController else {return}
        //set show style
        ModalVC.modalPresentationStyle = .popover
        
        ModalVC.car_brand_select = brandID
        ModalVC.car_model_select = modelID
        
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

//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return car_detail[car_brand_select].count
//    }
//}
//
//extension ViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = HolidayView.dequeueReusableCell(withIdentifier: "HolidayCell_ID", for: indexPath) as! HolidayCell
//        cell.config(date: holiday_detail_array[indexPath.item]["date"]!, name: holiday_detail_array[indexPath.item]["name"]!)
//
//        return cell
//    }
//}
