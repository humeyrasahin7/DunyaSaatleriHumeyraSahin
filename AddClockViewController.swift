//
//  AddClockViewController.swift
//  DunyaSaatleriHumeyraSahin
//
//  Created by Hümeyra Şahin on 24.11.2021.
//

import UIKit

class AddClockViewController: UIViewController {
    
    var img: UIImage?
    
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var clockImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Saat Ekle"
        
    }
    
    @IBAction func addTapped(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController{
            
            //alınan renklerden saati telefon saati + o ülkenin saati şeklinde oluşturmayı düşündüm enum'la
            //vc.clockCell.append(<#T##newElement: ClockCell##ClockCell#>)
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController{
            
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
}
