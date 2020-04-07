//
//  WFCoord.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on April 7, 2020

import Foundation
import SwiftyJSON


class WFCoord : NSObject, NSCoding{

    var lat : Float!
    var lon : Float!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        lat = json["lat"].floatValue
        lon = json["lon"].floatValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if lat != nil{
        	dictionary["lat"] = lat
        }
        if lon != nil{
        	dictionary["lon"] = lon
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		lat = aDecoder.decodeObject(forKey: "lat") as? Float
		lon = aDecoder.decodeObject(forKey: "lon") as? Float
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if lat != nil{
			aCoder.encode(lat, forKey: "lat")
		}
		if lon != nil{
			aCoder.encode(lon, forKey: "lon")
		}

	}

}
