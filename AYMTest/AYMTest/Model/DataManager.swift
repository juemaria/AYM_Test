//
//  DataManager.swift
//  AYMTest
//
//  Created by Dhils Paul on 5/3/18.
//  Copyright © 2018 AYM. All rights reserved.
//

import Foundation


class NearBy
{
    public private(set) var id :String?
    public private(set) var name : String?
    public private(set) var rating: Any?
    public private(set) var types :Any?
    public private(set) var placeid : String?
    var address : String?
    var photo = [photos]()
    init(Geometry:[String:Any])
    {
       if let ids = Geometry["id"]
       {
        self.id = ids as! String
        }
        if let name = Geometry["name"]
        {
            self.name = name as! String
        }
        if let rate = Geometry["rating"]
        {
            self.rating = rate
        }
        if let place = Geometry["place_id"]
        {
            self.placeid = place as! String
        }
        if let address = Geometry["vicinity"]
        {
            self.address =  address as! String
        }
        if let type = Geometry["types"]
                {
            self.types = type
                }
        if let pho = Geometry["photos"]
        {
            self.photo = [photos(Photoz: pho as! [[String : Any]])]
        }
    }
}
class photos
{
    public private(set) var photorefernce : String?
    init(Photoz:[[String:Any]])
    {
        for value in Photoz
        {
        if let photoref = value["photo_reference"]
        {
            self.photorefernce = photoref as! String
        }
        }
    }
}

    


