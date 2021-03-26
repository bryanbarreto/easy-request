//
//  Extensions.swift
//  
//
//  Created by Bryan Barreto Soares on 26/03/21.
//

import Foundation


// MARK: - URL extension
public extension URL {
    static func withPercentEncoding(string: String) -> URL? {
        let strWithPercentEncoding = string.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        return URL(string: strWithPercentEncoding)
    }
}
