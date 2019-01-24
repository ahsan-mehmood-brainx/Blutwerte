
//
//  APIManager.swift
//  Give Savvy
//
//  Created by Hunain Shahid on 31/01/2018.
//  Copyright © 2018 Brainx Technologies. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import FBSDKLoginKit

typealias userCompletionHandler = (_ user: User?, _ error: CustomError?) -> (Void)

class APIManager {
    public static let shared = APIManager()
    private init() { }
    
    func registerUser(user: User, completionHandler: @escaping userCompletionHandler) {
        let url = AppConstant.Server.SIGNUP_ENDPOINT
        let parameter: Parameters = user.toJSON()
        
        Alamofire.request(
            url,
            method: .post,
            parameters: parameter,
            encoding: JSONEncoding.default)
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    completionHandler(nil, error)
                    return
                }
                
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    completionHandler(nil, err)
                    return
                }
                
                if let user = Mapper<User>().map(JSONObject: response.result.value) {
                    completionHandler(user, nil)
                    return
                }
                
                let error = CustomError("Server Error")
                completionHandler(nil, error)
        }
    }
}
