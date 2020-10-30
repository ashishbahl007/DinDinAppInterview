//
//  EndPointType.swift
//  DinDinInterview
//
//  Created by Ashish Bahl on 26/10/20.
//  Copyright © 2020 Ashish Bahl. All rights reserved.
//

import UIKit

protocol EndPointType {
    var baseURL    : URL          { get }
    var path       : String       { get }
    var httpMethod : HTTPMethod   { get }
    var task       : HTTPTask     { get }
    var headers    : HTTPHeaders? { get }
}
