//
//  Data+PrettyPrintedJSON.swift
//  NetworkLogger
//
//  Created by Lukáš Hromadník on 21.08.2021.
//

import Foundation

extension Data {
    var prettyPrintedJSON: String {
        if
            let json = try? JSONSerialization.jsonObject(with: self, options: []),
            let prettyData = try? JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted]),
            let prettyString = String(data: prettyData, encoding: .utf8)
        {
            return prettyString
        } else if let jsonString = String(data: self, encoding: .utf8) {
            return jsonString
        }

        return ""
    }
}
