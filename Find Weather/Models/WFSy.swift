//
//  WFSy.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on April 7, 2020

import Foundation
import SwiftyJSON


class WFSy : NSObject, NSCoding{

    var country : String!
    var id : Int!
    var sunrise : Int!
    var sunset : Int!
    var type : Int!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        country = json["country"].stringValue
        id = json["id"].intValue
        sunrise = json["sunrise"].intValue
        sunset = json["sunset"].intValue
        type = json["type"].intValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if country != nil{
        	dictionary["country"] = country
        }
        if id != nil{
        	dictionary["id"] = id
        }
        if sunrise != nil{
        	dictionary["sunrise"] = sunrise
        }
        if sunset != nil{
        	dictionary["sunset"] = sunset
        }
        if type != nil{
        	dictionary["type"] = type
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		country = aDecoder.decodeObject(forKey: "country") as? String
		id = aDecoder.decodeObject(forKey: "id") as? Int
		sunrise = aDecoder.decodeObject(forKey: "sunrise") as? Int
		sunset = aDecoder.decodeObject(forKey: "sunset") as? Int
		type = aDecoder.decodeObject(forKey: "type") as? Int
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if country != nil{
			aCoder.encode(country, forKey: "country")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if sunrise != nil{
			aCoder.encode(sunrise, forKey: "sunrise")
		}
		if sunset != nil{
			aCoder.encode(sunset, forKey: "sunset")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}

	}

}
