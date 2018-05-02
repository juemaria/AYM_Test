//
//  WebService.swift
//  AYMTest
//
//  Created by Dhils Paul on 5/2/18.
//  Copyright © 2018 AYM. All rights reserved.
//

import Foundation
import GooglePlaces

//var currentLocation = GMSPlaceLikelihoodList
class WebService
{
    static var Instance = WebService()
    var Location:GMSPlacesClient = GMSPlacesClient.shared()
    
    
    func getCurrentPlace(completion:@escaping (GMSPlaceLikelihoodList) ->()) {
        Location.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                 print(error)
                 return
            }
            
      
            //  self.addressLabel.text = ""
            
            if let placeLikelihoodList = placeLikelihoodList {
//               // let place = placeLikelihoodList.likelihoods.first?.place
//                let likehoods = placeLikelihoodList.likelihoods
//
//                for object in likehoods
//                {
//                   if object.place.types.contains("restaurant") == true
//                   {
//                    let details = NearByPlace(json: object)
//                    self.Resturant.append(details)
//                    }
                    //completion(self.ResturantDeatails)
                completion(placeLikelihoodList)
                }
                
//                if (placeLikelihoodList.likelihoods[1].place.rating >= 5)
//                {
//                    let NearByPlace =
//                }
//
//                if let place = place2 {
//                    //self.Place.text = place.name
//                    print(place)
////                    //  self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
////                    //.joined(separator: "\n")
             //  }
            
        //}
        })
}
}
