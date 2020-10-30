//
//  NetworkRouter.swift
//  DinDinInterview
//
//  Created by Ashish Bahl on 26/10/20.
//  Copyright © 2020 Ashish Bahl. All rights reserved.
//

import UIKit

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter : class {
    associatedtype EndPoint : EndPointType
    func request(_ route : EndPoint, completion : @escaping NetworkRouterCompletion)
    func cancel()
}
