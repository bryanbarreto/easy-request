//
//  File.swift
//  
//
//  Created by Bryan Barreto Soares on 26/03/21.
//

import Foundation


public enum RequestError: Error {
    case clientError
    case serverError
    case noData
    case dataDecodingError
}
