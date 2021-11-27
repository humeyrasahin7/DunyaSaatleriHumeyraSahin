//
//  ViewController.swift
//  DunyaSaatleriHumeyraSahin
//
//  Created by Hümeyra Şahin on 24.11.2021.
//

import UIKit
//MARK: Aciklama

//combobox oluşturamadım eğer oluşturabilseydim enumla kontrol etmeyi düşünmüştüm renkleri bir fonksiyonun içinde bu sayede tekrara düşmemiş olacaktım fakat koda dökemedim.
//uygulamayı kaydetmeyi userdefaults ya da keyChain kullanarak yapmayı planlamıştım.

class ViewController: UICollectionViewController  {
    var clockCell = [ClockCell]()
    let clockAdd = ClockCell()
   
    var colorsArray =  [String]()
    var cityNamesArray = [String]()
    var colorNamesArray =  [String]()
    
    var color: String!
    var cityName: String!
    var colorName: String!
    
    let img = UIImage(named: "addIcon")
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Dünya Saatleri"
        
        clockAdd.img = img
        clockAdd.city = ""
        clockAdd.clock = ""
        clockCell.append(clockAdd)
       
        
        let urlString = "https://gist.githubusercontent.com/humeyrasahin7/0babdfe29add57d1dc24c48ea19f6063/raw/ffae2b181e1357acbe9dfa719282265e4ae6c5c9/deneme.json"
        
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                print(url)
                return
            }
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clockCell.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClockCell", for: indexPath) as? ClockCell else {
             fatalError("unable to qequeue PersonCell")
         }
        cell.cityNameLabel.text = clockCell[indexPath.item].city
        cell.timeDifferenceLabel.text = clockCell[indexPath.item].clock
        cell.clockImage.image = clockCell[indexPath.item].img
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toAddClockVC", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddClockVC"{
            let destinationVC = segue.destination as! AddClockViewController
            
        }
    }
    
    func parse(json: Data){
        
        let decoder = JSONDecoder()
        if let jsonCities = try? decoder.decode(ColorsAndCities.self, from: json){
            cityName = jsonCities.city
            color = jsonCities.hex
            colorName = jsonCities.color
            
        }
                    
    }

}

