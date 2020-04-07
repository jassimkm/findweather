//
//  WFWeather.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on April 7, 2020

import Foundation
import SwiftyJSON


class WFWeather : NSObject, NSCoding{

    var descriptionField : String!
    var icon : String!
    var id : Int!
    var main : String!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        descriptionField = json["description"].stringValue
        icon = json["icon"].stringValue
        id = json["id"].intValue
        main = json["main"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if descriptionField != nil{
        	dictionary["description"] = descriptionField
        }
        if icon != nil{
        	dictionary["icon"] = icon
        }
        if id != nil{
        	dictionary["id"] = id
        }
        if main != nil{
        	dictionary["main"] = main
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		descriptionField = aDecoder.decodeObject(forKey: "description") as? String
		icon = aDecoder.decodeObject(forKey: "icon") as? String
		id = aDecoder.decodeObject(forKey: "id") as? Int
		main = aDecoder.decodeObject(forKey: "main") as? String
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if icon != nil{
			aCoder.encode(icon, forKey: "icon")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if main != nil{
			aCoder.encode(main, forKey: "main")
		}

	}

}
