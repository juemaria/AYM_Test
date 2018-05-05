//
//  WebService.swift
//  AYMTest
//
//  Created by Dhils Paul on 5/2/18.
//  Copyright © 2018 AYM. All rights reserved.
//

import Foundation
import Alamofire

class WebService
{
    static var Instance = WebService()
    func CurrentLocation(url:String,JsonResponse: @escaping(AnyObject)->())
    {
        let header = ["Content-Type": "application/json"]

        Alamofire.request(url, method: .get, parameters: nil, encoding:JSONEncoding.default, headers: header).responseJSON(completionHandler:{ (response) in
            JsonResponse(response.result.value as AnyObject)
        })
    }
    
    func getNearByPlace(completion: @escaping (AnyObject) ->())
    {
        let url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(LatitudeR),\(LongitudeR)&types=restaurent&radius=500&&key=\(NEARAPI)"
        print(url)
        Alamofire.request(url,method: .get , parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: {(response) in
            completion(response.result.value as AnyObject)
        })
    }
}
