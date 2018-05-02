//
//  DataModel.swift
//  AYMTest
//
//  Created by Dhils Paul on 5/2/18.
//  Copyright © 2018 AYM. All rights reserved.
//

import Foundation
import GooglePlaces

class NearByRestaurant{
   
     public private(set) var PlaceName  : String!
     public private(set) var Address  : String?
     public private(set) var Rating  : Float?
    init(json:GMSPlaceLikelihood)
    {
        print("reached data")
     let PName = json.place.name
        self.PlaceName = PName
        
        if let address = json.place.formattedAddress
        {
            self.Address = address
             print(Address!)
        }
        let rating = json.place.rating
            self.Rating = rating
    
    }
}
