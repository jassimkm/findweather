//
//  ViewController.swift
//  Smart Weather
//
//  Created by Jassim Mukthar on 07/04/2020.
//  Copyright © 2020 Jassim. All rights reserved.
//

import UIKit
import CoreLocation
import SDWebImage

class ViewController: UIViewController {
    var locationManager: CLLocationManager?
    var lastLocation: CLLocation?
    var datasource = [WFWeatherModel]()
    {
        didSet{
            self.tableView.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchbar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.estimatedRowHeight = 110
        self.tableView.rowHeight = UITableView.automaticDimension
        let myLocationBtn = UIBarButtonItem(title: "Forecast", style: .plain, target: self, action: #selector(ViewController.getCurrentLocation))
        self.navigationItem.rightBarButtonItem = myLocationBtn
        searchbar.delegate = self
        searchbar.showsCancelButton = true
        self.locationManager = CLLocationManager()

        if CLLocationManager.authorizationStatus() == .notDetermined {
              self.locationManager?.requestAlwaysAuthorization()
          }
        // Do any additional setup after loading the view.
    }
    
    @objc func getCurrentLocation()
    {
        self.locationManager = CLLocationManager()
        
        guard let locationManager = self.locationManager else {  return }
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        }
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 100
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    func getWeatherDataForCities(cities:[String])
    {
        var datasourceModel = [WFWeatherModel]()
        for city in cities
        {
            self.getWeatherOfCity(city: city) { (weather, status) in
                if status, weather != nil
                {
                    datasourceModel.append(weather!)
                    self.datasource = datasourceModel

                }
            }
        }
    }
    
    func getWeatherForecastForCurrentLocation(location:CLLocation)
    {
        self.getWeatherForeCastFromCoordinates(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude) { (weather, status) in
            if status , weather != nil
            {
                self.datasource = weather!
            }
        }
        self.tableView.reloadData()

    }
    
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
    func getWeatherForeCastFromCoordinates(latitude:Double,longitude:Double,completion:@escaping (_ result: [WFWeatherModel]?, _ sucess: Bool)->())
    {
        guard let url = URL(string: Constants.weatherForecastApi + "?lat=\(latitude)&lon=\(longitude)&appid=\(Constants.APIKEY)&units=metric")
            else{
                
                return
        }
        APIHelper.shared.getAPI(strURL: url, showHUD: true) { (data, status) in
            if status,let array = data["list"].array
            {
                let weathermodel = array.map({return WFWeatherModel(fromJson: $0)})
                completion(weathermodel,true)
              }
            else
            {
                completion(nil,false)
            }
        }
    }
    
}
extension ViewController:CLLocationManagerDelegate
{

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else {
            print("No Locations,\(locations.first?.coordinate)")
            return
        }
        print(" Locations,\(locations.first?.coordinate)")

        manager.stopUpdatingLocation()
        
        self.lastLocation = location
        self.getWeatherForecastForCurrentLocation(location: location)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
     
         ERAlertController.showAlert("Alert!", message:error.localizedDescription, isCancel: false, okButtonTitle: "OK", cancelButtonTitle: "", completion: nil)

    }
}
extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell") as! WeatherTableViewCell
        let currentWeatherModel = self.datasource[indexPath.row]
        cell.weatherDescription.text = currentWeatherModel.weather.first?.descriptionField ?? ""
        cell.maxTemprature.text = String(currentWeatherModel.main.tempMax ?? 0) + "°C"
        cell.minTemprature.text = String(currentWeatherModel.main.tempMin ?? 0) + "°C"
        cell.windSpeed.text = String(currentWeatherModel.wind.speed ?? 0) + " m/s"
        if let icon = currentWeatherModel.weather.first?.icon, let url =  URL(string: Constants.iconBaseUrl + icon + "@2x.png")
            {
                cell.iconImageView.sd_setImage(with: url, completed: nil)
            }
            else
            {
                cell.iconImageView.image = nil
            }
            
        return cell
    }
    
    
    
}
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            
            ERAlertController.showAlert("Alert!", message: "Please enter minimum 3 city names", isCancel: false, okButtonTitle: "OK", cancelButtonTitle: "", completion: nil)
            
            return
        }
        let cities = searchText.components(separatedBy: ",")
        print(cities)
        guard !(cities.count < 3 || cities.count > 7)  else {
            
            ERAlertController.showAlert("Alert!", message: "Please enter minimum 3 city names and maximum 7 city names", isCancel: false, okButtonTitle: "OK", cancelButtonTitle: "", completion: nil)
            
            return
        }
        self.getWeatherDataForCities(cities: cities)
    }
}
