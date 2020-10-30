//
//  HTTPTask.swift
//  DinDinInterview
//
//  Created by Ashish Bahl on 26/10/20.
//  Copyright © 2020 Ashish Bahl. All rights reserved.
//

public typealias HTTPHeaders = [String : String]

public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters : Parameters?, urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters : Parameters?, urlParameters: Parameters?, additionalHeaders : HTTPHeaders?)
}
