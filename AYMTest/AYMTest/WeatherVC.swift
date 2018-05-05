//
//  WeatherVC.swift
//  AYMTest
//
//  Created by Dhils Paul on 5/2/18.
//  Copyright © 2018 AYM. All rights reserved.
//

import UIKit
import GooglePlaces
import Alamofire

class WeatherVC: UIViewController,CLLocationManagerDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
   //Outlets
    @IBOutlet var Notification: UILabel!
    @IBOutlet var Day: UILabel!
    @IBOutlet var Desc: UILabel!
    @IBOutlet var WeatherImage: UIImageView!
    @IBOutlet var temp: UILabel!
    @IBOutlet var Percipitation: UILabel!
    @IBOutlet var Wind: UILabel!
    @IBOutlet var HumidityHed: UILabel!
    @IBOutlet var Humidity: UILabel!
    @IBOutlet var Animator: UIActivityIndicatorView!
    @IBOutlet var Collection: UICollectionView!
    @IBOutlet var Place: UILabel!
    @IBOutlet var PercipH: UILabel!
    @IBOutlet var WindH: UILabel!
    // Variables
    var arraydemo = [String]()
    var Today = String()
    let locationManager = CLLocationManager()
    var TODAY = [WeatherDetails]()
    var Placename = String()
    fileprivate var WEATHER = [WeatherDetails]()
    fileprivate var FORCAST = [WeatherDetails]()
    
    override func viewDidLoad() {
       super.viewDidLoad()
        Notification.isHidden = true
        Animator.startAnimating()
        let unit = "units=metric"
        let Latitude = Int(LatitudeR)
        let Longitude = Int(LongitudeR)
        PlaceName()
        let urlString = "\(BASEURL)&lat=\(Latitude)&lon=\(Longitude)&\(unit)&APPID=\(WeaterApi)"
        WebService.Instance.CurrentLocation(url: urlString, JsonResponse: {(response) in
            let task = response["list"] as! [[String:Any]]
            let today = Date()
            print(today)
            let s = String(describing: today)
            let toDay = s.components(separatedBy: " ")
            self.Today = toDay[0]
            print(self.Today)
            for obj in task
            {
               let WeatherDatas = WeatherDetails(data: obj)
             self.WEATHER.append(WeatherDatas)
               
                let a = WeatherDatas.dateandtime!
                let b = String(describing: a)
                let dates = b.components(separatedBy: " ")
                if self.arraydemo.contains(dates[0])
               {
                 print("duplicate")
                }
                else if self.Today == dates[0]
                {
                    print("today")
              self.TODAY.append(WeatherDatas)
                     self.population()
                }
                else{
                    print(dates[0])
                     self.arraydemo.append(dates[0])
                    self.FORCAST.append(WeatherDatas)
                    print(self.FORCAST.count)
                }
            }
            
            DispatchQueue.main.async {
               
                self.Collection.reloadData()
                self.Animator.stopAnimating()
                self.Animator.isHidden = true
                if self.TODAY.count == 0 {
                    self.Notification.isHidden = false
                }
            }
            
        })
    }
    func PlaceName()
    {
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: LatitudeR, longitude: LongitudeR)
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            //print(placeMark.postalAddress as Any)
            if let locationName = placeMark.name  {
                self.Placename = locationName
            }
        })
    }
    func population()
    {
        
            let mainimg = String(describing: self.TODAY[0].weather[0].icon!)
            let url =  URL(string:"\(IMAGEURL)/\(mainimg).png" )
            let data = try?Data(contentsOf:url!)
            let sample = TODAY.first?.Maindata.first?.Humidity
            let a = String(describing: self.TODAY[0].Maindata[0].Humidity!)
            self.Humidity.text = a
            self.Desc.text = String(describing: self.TODAY[0].weather[0].description!)
            self.temp.text = String(describing: self.TODAY[0].Maindata[0].Temperature!)
            self.Wind.text = String(describing: self.TODAY[0].winds[0].windss!)
            self.Day.text = Today
            self.WeatherImage.image = UIImage(data: data!)
     PercipH.text =  "Percipitation"
        HumidityHed.text = "Humidity"
        WindH.text = "Wind"
        Percipitation.text = "0%"

    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FORCAST.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cells = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell
        {
             let Celldetail = FORCAST[indexPath.item]
             cells.UpdateCells(item:Celldetail)
    
            return cells
        }
        else{
            return CollectionViewCell()
        }
    }
}
