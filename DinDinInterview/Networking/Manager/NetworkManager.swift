//
//  NetworkManager.swift
//  DinDinInterview
//
//  Created by Ashish Bahl on 26/10/20.
//  Copyright © 2020 Ashish Bahl. All rights reserved.
//

import UIKit

struct NetworkManager {
    static let enviornment : NetworkEnviornment = .production
}

enum NetworkEnviornment {
    case production
    case development
}
enum NetworkResponse : String {
    case success
    case authenticationError = "You need to be authenticated first"
    case badRequest = "Bad Request"
    case failed = "Network Request Failed"
    case noData = "Response returned with no data to decode"
    case unableToDecode = "Unable to decode the response"
    case outdated = "The url requested is outdated"
}

enum Result<String> {
    case success
    case failure(String)
}

fileprivate func handleNetworkResponse(_ response : HTTPURLResponse) -> Result<String> {
    switch response.statusCode {
    case 200...299 :
        return .success
    case 401...500 :
        return .failure(NetworkResponse.authenticationError.rawValue)
    case 501...599 :
    return .failure(NetworkResponse.badRequest.rawValue)
    case 600 :
        return .failure(NetworkResponse.outdated.rawValue)
    default:
        return .failure(NetworkResponse.failed.rawValue)
    }
}
