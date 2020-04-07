//
//  APIHelper.swift
//  Find Weather
//
//  Created by Jassim Mukthar on 07/04/2020.
//  Copyright © 2020 Jassim. All rights reserved.
//
import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import Toast_Swift
class APIHelper: NSObject {
    
    var header =  ["":""]
    
    static let shared = APIHelper()
    var sessionManager = Session(configuration: URLSessionConfiguration.default)
    //MARK: - Get Method
    
    func getAPI(strURL: URL,showHUD : Bool, parameter:[String:Any]? = nil,header:[String:String]? = nil,completion:@escaping (_ result: JSON, _ sucess: Bool)->()) -> Void {
        
        var headers : HTTPHeaders?
        if header != nil
        {
            headers = HTTPHeaders(header!)
        }
        if !Connectivity.isConnectedToInternet() {
            DispatchQueue.main.async {
                
                ERAlertController.showAlert("Alert!", message: "Please check internet connection", isCancel: false, okButtonTitle: "OK", cancelButtonTitle: "", completion: nil)
                LoaderClass.hideActivityIndicator()
                print("No Internet")
            }
        } else {
            if showHUD {DispatchQueue.main.async {LoaderClass.showActivityIndicator()}}
            print(strURL.absoluteString)
            sessionManager.request(strURL, method: .get, parameters: parameter, encoding: URLEncoding.default, headers: headers ).responseJSON{ (response) -> Void in
                switch response.result {
                case .success(let value):
         
                    
                    print(JSON(value))

                    completion(JSON(value),true)
                case .failure(let error):
                    print(error)
                    if response.response?.statusCode == 401
                    {
 
                        return
                    }

                    
                    completion(JSON.null,false)
                }
            }
        }
    }
}
class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
class LoaderClass: NSObject {
    //static var loader = JMLottieLoader(with: "loaderSlab")
    //MARK: -- Indicator --
    static func showActivityIndicator(){
      //  loader.startAnimation()
    }
    static func hideActivityIndicator(){
   //     loader.stopAnimation()
    }
}
