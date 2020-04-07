//
//  WFWind.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on April 7, 2020

import Foundation
import SwiftyJSON


class WFWind : NSObject, NSCoding{

    var speed : Float!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        speed = json["speed"].floatValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if speed != nil{
        	dictionary["speed"] = speed
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		speed = aDecoder.decodeObject(forKey: "speed") as? Float
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if speed != nil{
			aCoder.encode(speed, forKey: "speed")
		}

	}

}
