//
//  ParameterEncoding.swift
//  DinDinInterview
//
//  Created by Ashish Bahl on 26/10/20.
//  Copyright © 2020 Ashish Bahl. All rights reserved.
//

import UIKit

public typealias Parameters = [String : Any]

public protocol ParameterEncoder {
 static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public enum NetworkError : String, Error {
    case parametersNil = "Params are nil"
    case encodingFailed = "Params encoding failed"
    case missingURL = "URL Is nil or missing"
}
