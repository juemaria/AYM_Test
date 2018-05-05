//
//  CollectionViewCell.swift
//  AYMTest
//
//  Created by Dhils Paul on 5/3/18.
//  Copyright © 2018 AYM. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var tem_min: UILabel!
    @IBOutlet var day: UILabel!
    @IBOutlet var tem_max: UILabel!
    @IBOutlet var Img: UIImageView!
    
    func UpdateCells(item:WeatherDetails)
    {
        day.text = item.dateandtime as? String
        let max = String(describing: item.Maindata[0].tempMax! )
        let min = String(describing: item.Maindata[0].tempMax! )
         tem_max.text = max
         tem_min.text = min
        let iconid = String(describing: item.weather[0].icon!)
        let url =  URL(string:"\(IMAGEURL)/\(iconid).png" )
        let data = try?Data(contentsOf:url!)
       Img.image = UIImage(data: data!)

    }
    
}
