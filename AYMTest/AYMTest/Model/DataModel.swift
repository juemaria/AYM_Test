//
//  DataModel.swift
//  AYMTest
//
//  Created by Dhils Paul on 5/2/18.
//  Copyright © 2018 AYM. All rights reserved.
//

import Foundation

class WeatherDetails
{
   public private(set) var dateandtime :Any?
    var Maindata = [maindata]()
    var weather = [Weather]()
   var winds = [Wind]()
    init(data:[String:Any])
    {
       if let datetime = data["dt_txt"]
            {
                self.dateandtime = datetime
                    }
        
            if let main = data["main"]
        {
            self.Maindata = [maindata(json:main as! [String : Any])]
        }
        if let wea = data["weather"] as? [[String:Any]]
        {
            self.weather = [Weather(datas: wea)]
        }
        if let wind = data["wind"]
        {
            self.winds = [Wind(datas: wind as! [String : Any])]
        }
    }
}
class  maindata
{
    public private(set) var Temperature :Any?
     public private(set) var tempMax : Any?
     public private(set) var tempMin :Any?
    public private(set) var Humidity : Any?
    init(json:[String:Any])
    {
       if let Temp = json["temp"]
       {
        self.Temperature = Temp
        }
        if let maxTemp = json["temp_max"]
        {
            self.tempMax = maxTemp
        }
        if let minTemp = json["temp_min"]
        {
            self.tempMin = minTemp 
        }
        if let humidity = json["humidity"]
             {
                self.Humidity = humidity
        }
    }
    
}
class Weather
{
 
    public private(set) var description : String?
    public private(set) var icon : String?
    init(datas:[[String:Any]])
    {
        for value in datas{
        if let Des = value["description"]
        {
            self.description = Des as? String
        }
        if let icon = value["icon"]
        {
            self.icon = icon as? String
        }
        }
    }

}
class Wind
{
    public private(set) var windss : Any?

init(datas:[String:Any])
{
    if let Wind = datas["deg"]
    {
        self.windss = Wind
    }
    
    }
}
