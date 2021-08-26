//
//  URLRequest.swift
//  NetworkLogger
//
//  Created by Lukáš Hromadník on 21.08.2021.
//

import Foundation

extension URLRequest {
    var urlDescription: String {
        var debugString = ""
        if let method = httpMethod {
            debugString += "\(method) "
        }

        if let urlString = url?.absoluteString {
            debugString += urlString
        }

        return debugString
    }
}
