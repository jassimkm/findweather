//
//  WFWeatherModel.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on April 7, 2020

import Foundation
import SwiftyJSON


class WFWeatherModel : NSObject, NSCoding{

    var base : String!
    var clouds : WFCloud!
    var cod : Int!
    var coord : WFCoord!
    var dt : Int!
    var id : Int!
    var main : WFMain!
    var name : String!
    var sys : WFSy!
    var timezone : Int!
    var visibility : Int!
    var weather : [WFWeather]!
    var wind : WFWind!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        base = json["base"].stringValue
        let cloudsJson = json["clouds"]
        if !cloudsJson.isEmpty{
            clouds = WFCloud(fromJson: cloudsJson)
        }
        cod = json["cod"].intValue
        let coordJson = json["coord"]
        if !coordJson.isEmpty{
            coord = WFCoord(fromJson: coordJson)
        }
        dt = json["dt"].intValue
        id = json["id"].intValue
        let mainJson = json["main"]
        if !mainJson.isEmpty{
            main = WFMain(fromJson: mainJson)
        }
        name = json["name"].stringValue
        let sysJson = json["sys"]
        if !sysJson.isEmpty{
            sys = WFSy(fromJson: sysJson)
        }
        timezone = json["timezone"].intValue
        visibility = json["visibility"].intValue
        weather = [WFWeather]()
        let weatherArray = json["weather"].arrayValue
        for weatherJson in weatherArray{
            let value = WFWeather(fromJson: weatherJson)
            weather.append(value)
        }
        let windJson = json["wind"]
        if !windJson.isEmpty{
            wind = WFWind(fromJson: windJson)
        }
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if base != nil{
        	dictionary["base"] = base
        }
        if clouds != nil{
        	dictionary["clouds"] = clouds.toDictionary()
        }
        if cod != nil{
        	dictionary["cod"] = cod
        }
        if coord != nil{
        	dictionary["coord"] = coord.toDictionary()
        }
        if dt != nil{
        	dictionary["dt"] = dt
        }
        if id != nil{
        	dictionary["id"] = id
        }
        if main != nil{
        	dictionary["main"] = main.toDictionary()
        }
        if name != nil{
        	dictionary["name"] = name
        }
        if sys != nil{
        	dictionary["sys"] = sys.toDictionary()
        }
        if timezone != nil{
        	dictionary["timezone"] = timezone
        }
        if visibility != nil{
        	dictionary["visibility"] = visibility
        }
        if weather != nil{
        var dictionaryElements = [[String:Any]]()
        for weatherElement in weather {
        	dictionaryElements.append(weatherElement.toDictionary())
        }
        dictionary["weather"] = dictionaryElements
        }
        if wind != nil{
        	dictionary["wind"] = wind.toDictionary()
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		base = aDecoder.decodeObject(forKey: "base") as? String
		clouds = aDecoder.decodeObject(forKey: "clouds") as? WFCloud
		cod = aDecoder.decodeObject(forKey: "cod") as? Int
		coord = aDecoder.decodeObject(forKey: "coord") as? WFCoord
		dt = aDecoder.decodeObject(forKey: "dt") as? Int
		id = aDecoder.decodeObject(forKey: "id") as? Int
		main = aDecoder.decodeObject(forKey: "main") as? WFMain
		name = aDecoder.decodeObject(forKey: "name") as? String
		sys = aDecoder.decodeObject(forKey: "sys") as? WFSy
		timezone = aDecoder.decodeObject(forKey: "timezone") as? Int
		visibility = aDecoder.decodeObject(forKey: "visibility") as? Int
		weather = aDecoder.decodeObject(forKey: "weather") as? [WFWeather]
		wind = aDecoder.decodeObject(forKey: "wind") as? WFWind
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if base != nil{
			aCoder.encode(base, forKey: "base")
		}
		if clouds != nil{
			aCoder.encode(clouds, forKey: "clouds")
		}
		if cod != nil{
			aCoder.encode(cod, forKey: "cod")
		}
		if coord != nil{
			aCoder.encode(coord, forKey: "coord")
		}
		if dt != nil{
			aCoder.encode(dt, forKey: "dt")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if main != nil{
			aCoder.encode(main, forKey: "main")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if sys != nil{
			aCoder.encode(sys, forKey: "sys")
		}
		if timezone != nil{
			aCoder.encode(timezone, forKey: "timezone")
		}
		if visibility != nil{
			aCoder.encode(visibility, forKey: "visibility")
		}
		if weather != nil{
			aCoder.encode(weather, forKey: "weather")
		}
		if wind != nil{
			aCoder.encode(wind, forKey: "wind")
		}

	}

}
