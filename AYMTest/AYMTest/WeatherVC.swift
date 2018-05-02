//
//  WeatherVC.swift
//  AYMTest
//
//  Created by Dhils Paul on 5/2/18.
//  Copyright © 2018 AYM. All rights reserved.
//

import UIKit
import GooglePlaces

class WeatherVC: UIViewController {
    @IBOutlet var Place: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 WebService.Instance.getCurrentPlace(completion: {(placelikelihoodList) in
    
    let Latitude :Int = Int((placelikelihoodList.likelihoods.first?.place.coordinate.latitude)!)
    let Longitude: Int = Int((placelikelihoodList.likelihoods.first?.place.coordinate.longitude)!)
    
    
    self.Place.text = placelikelihoodList.likelihoods.first?.place.name
    let urlstring = "\(BASEURL)lat=\(Latitude)&lon=\(Longitude)&APPID=\(WeaterApi)"
    print(urlstring)
        })
     
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
