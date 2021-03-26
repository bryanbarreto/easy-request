//
//  Resource.swift
//  
//
//  Created by Bryan Barreto Soares on 26/03/21.
//

import Foundation


public struct Resource<T: Decodable> {
    let url: URL
    let httpMethod: HttpMethod
    let httpBody: Data?
    let headers: [String: String]
    let debugPrint: Bool
    
    public init(url: URL, httpMethod: HttpMethod = .get, httpBody: Data? = nil, headers: [String: String] = [:], debugPrint: Bool = false) {
        self.url = url
        self.httpMethod = httpMethod
        self.httpBody = httpBody
        self.headers = headers
        self.debugPrint = debugPrint
    }
}
