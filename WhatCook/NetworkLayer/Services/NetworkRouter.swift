//
//  NetworkRouter.swift
//  WhatCook
//
//  Created by Сергей  Бей on 22.06.2021.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?) -> ()

protocol NetworkRouter: AnyObject {
    associatedtype EndPoint: EndPointType
    func request(_ router: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
