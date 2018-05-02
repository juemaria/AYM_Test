//
//  Tablecell.swift
//  AYMTest
//
//  Created by Dhils Paul on 5/2/18.
//  Copyright © 2018 AYM. All rights reserved.
//

import UIKit

class Tablecell: UITableViewCell {
    @IBOutlet var Picture: UIImageView!
    @IBOutlet var ResturentName: UILabel!
    @IBOutlet var address: UILabel!
    
  
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateView(item :NearByRestaurant)
{
    ResturentName.text = item.Address
   address.text = item.PlaceName
    }
    
}
