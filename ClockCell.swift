//
//  ClockCell.swift
//  DunyaSaatleriHumeyraSahin
//
//  Created by Hümeyra Şahin on 24.11.2021.
//

import Foundation
import UIKit

class ClockCell: UICollectionViewCell{
    var img: UIImage?
    var clock: String?
    var city: String?
    @IBOutlet var clockImage: UIImageView!
    @IBOutlet var timeDifferenceLabel: UILabel!
    @IBOutlet var cityNameLabel: UILabel!
    
    
}
