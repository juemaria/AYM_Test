//
//  Tablecell.swift
//  AYMTest
//
//  Created by Dhils Paul on 5/2/18.
//  Copyright © 2018 AYM. All rights reserved.
//

import UIKit

class Tablecell: UITableViewCell {
   
    @IBOutlet var img: UIImageView!
    @IBOutlet var rate: UILabel!
    @IBOutlet var Name: UILabel!
    @IBOutlet var address: UILabel!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
    func updateCell(item :NearBy)
{
  Name.text = String(item.name!)
    address.text = String(describing: item.address!)
    if item.rating != nil
    {
       rate.text =  String(describing: item.rating!)
    }
   else
    {
        rate.text = "0"
    }
    if  item.photo.first?.photorefernce != nil
    {
        let iconid = String(describing: item.photo[0].photorefernce!)
        let url =  URL(string:"\(RESTAURENTIMAGE)\(iconid)&key=\(NEARAPI)" )
        let data = try?Data(contentsOf:url!)
        img.image = UIImage(data: data!)
    }
    else
    {
        img.image = UIImage(named: "imgnot.png")
    }

    }
    
    
}
