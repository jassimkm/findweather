//
//  Smart_WeatherTests.swift
//  Smart WeatherTests
//
//  Created by Jassim Mukthar on 07/04/2020.
//  Copyright © 2020 Jassim. All rights reserved.
//

import XCTest
import SwiftyJSON

@testable import Find_Weather

class Find_WeatherTests: XCTestCase {
    var data: JSON?
    var controller: ViewController = ViewController()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            testGetWeatherOfCity()
        }
        
    }
    func testParsingWeatherModel() {
      // 1. given
        guard let json = Bundle(for: type(of: self)).path(forResource: "UnitTestData", ofType: "json") else {
            fatalError("UnitTestData.json not found")
        }
        guard let jsonString = try? String(contentsOfFile: json, encoding: .utf8) else {
            fatalError("Unable to convert UnitTestData.json to String")
        }
        guard let jsonData = jsonString.data(using: .utf8) else {
            fatalError("Unable to convert UnitTestData.json to Data")
        }
        data = JSON(jsonData)
        let WeatherModel = WFWeatherModel(fromJson: data!)
        XCTAssertNotNil(WeatherModel)
        XCTAssertNotNil(WeatherModel.name)
        XCTAssertEqual(WeatherModel.name, "Dubai")
    }
    
    func testGetWeatherOfCity() {
        testParsingWeatherModel()
        let WeatherModel = WFWeatherModel(fromJson: data!)

        GetWeather().getWeatherOfCity(city: "Dubai") { (weather, status) in
            if status,weather != nil
            {
                XCTAssertEqual(WeatherModel, weather)
            }
        }
    }

}
class GetWeather:XCTestCase
{
    func getWeatherOfCity(city:String,completion:@escaping (_ result: WFWeatherModel?, _ sucess: Bool)->())
    {
        guard let url = URL(string: Constants.cityWeatherApi + "?q=\(city)&appid=\(Constants.APIKEY)&units=metric")
            else{
                
                return
        }
        APIHelper.shared.getAPI(strURL: url, showHUD: true) { (data, status) in
            if status
            {
                let weathermodel = WFWeatherModel(fromJson: data)
                if weathermodel.cod == 200
                  {
                      completion(weathermodel,true)
                  }
                else
                {
                    completion(nil,false)
                }
            }
            else
            {
                completion(nil,false)
            }
        }
    }
}
