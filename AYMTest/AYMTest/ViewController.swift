//
//  ViewController.swift
//  AYMTest
//
//  Created by Dhils Paul on 5/2/18.
//  Copyright © 2018 AYM. All rights reserved.
//

import UIKit
import GooglePlaces

class ViewController: UIViewController,CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet var NearByPlace: UITableView!
    fileprivate var RDeatails = [NearByRestaurant]()
  //  var Location: GMSPlacesClient!
     var locationManager = CLLocationManager()
    // Add a pair of UILabels in Interface Builder, and connect the outlets to these variables.
    @IBOutlet var Place: UILabel!
    @IBOutlet var Sender: UIButton!
    
    //  @IBOutlet var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WebService.Instance.getCurrentPlace(completion: {(placelikelihoodList) in
           
                               // let place = placeLikelihoodList.likelihoods.first?.place
            let likehoods = placelikelihoodList.likelihoods
                
                                for object in likehoods
                                {
                                   if object.place.types.contains("restaurant") == true
                                   {
                                    let details = NearByRestaurant(json: object)
                                    self.RDeatails.append(details)
                                    }
            }
                DispatchQueue.main.async {
                    
                    self.NearByPlace.reloadData()
                }
            })
        
//        Location = GMSPlacesClient.shared()
//        print("reached")R
//
//        locationManager.requestAlwaysAuthorization()
//        locationManager.requestWhenInUseAuthorization()
        
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.delegate = self
//            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//            locationManager.startUpdatingLocation()
//        }
        
    }
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
//    }
    // Add a UIButton in Interface Builder, and connect the action to this function.
//    @IBAction func getCurrentPlace(_ sender: UIButton) {
//        print("button pressed")
//        Location.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
//            if let error = error {
//                print("Pick Place error: \(error.localizedDescription)")
//                return
//            }
//
//            self.Place.text = "no place"
//          //  self.addressLabel.text = ""
//
//            if let placeLikelihoodList = placeLikelihoodList {
//                let place = placeLikelihoodList.likelihoods.first?.place
//                if let place = place {
//                    self.Place.text = place.name
//
//                  //  self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
//                        //.joined(separator: "\n")
//                }
//            }
//        })
   // }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
    print(RDeatails.count)
        return RDeatails.count
    }
//
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseID", for: indexPath) as? Tablecell
        {
            cell.updateView(item:RDeatails[indexPath.row])
      
       return cell
        }
        else
        {
        return Tablecell()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

