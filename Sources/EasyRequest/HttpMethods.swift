//
//  HttpMethods.swift
//  
//
//  Created by Bryan Barreto Soares on 26/03/21.
//

import Foundation

public enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    
    public var value: String {
        return self.rawValue
    }
}
