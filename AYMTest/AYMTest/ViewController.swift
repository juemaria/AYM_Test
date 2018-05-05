//
//  ViewController.swift
//  AYMTest
//
//  Created by Dhils Paul on 5/2/18.
//  Copyright © 2018 AYM. All rights reserved.
//

import UIKit
import GooglePlaces
//Global variables
var LatitudeR = CLLocationDegrees()
var LongitudeR = CLLocationDegrees()
class ViewController: UIViewController,CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate {
    //Outlets
    @IBOutlet var Animator: UIActivityIndicatorView!
   @IBOutlet var RestaurentTable: UITableView!
    @IBOutlet var MenuBtn: UIButton!
    //Local Variables
     var locationManager = CLLocationManager()
    fileprivate var RDeatails = [NearBy]()
    override func viewDidLoad() {
        super.viewDidLoad()
      Animator.startAnimating()
        MenuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        getdevicelocation()
    }
    func getdevicelocation()
    {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            self.locationManager.startUpdatingLocation()
            locationManager.startUpdatingLocation()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
       
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return  }
        LatitudeR = locValue.latitude
        LongitudeR = locValue.longitude
        print(LatitudeR)
         webservice()
    }
        func webservice()
        {
            WebService.Instance.getNearByPlace(completion: {(response) in
            
                let task = response["results"] as! [[String:Any]]
                
                for obj in task{
                    let data = NearBy(Geometry:obj)
                    self.RDeatails.append(data)
                }
                self.RestaurentTable.reloadData()
                self.Animator.stopAnimating()
                self.Animator.isHidden = true
            })
           
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return RDeatails.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let tablecell = tableView.dequeueReusableCell(withIdentifier: "cells", for: indexPath) as? Tablecell
        {
            let cellDetails = RDeatails[indexPath.row]
            tablecell.updateCell(item:cellDetails)
       return tablecell
        }
        else
        {
        return Tablecell()
        }
    }
}

