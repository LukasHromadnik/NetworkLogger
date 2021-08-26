//
//  Formatter.swift
//  NetworkLogging
//
//  Created by Lukáš Hromadník on 22.08.2021.
//

import Foundation

public struct Formatter {
    public let formatRequest: (URLRequest) -> String?
    public let formatResponse: (HTTPURLResponse, URLRequest) -> String?
    public let formatHeaders: ([AnyHashable: Any]?) -> String?
    public let formatBody: (Data?) -> String?
}

public extension Formatter {
    static let `default` = Formatter(
        formatRequest: { request in
            "⬆️ " + request.urlDescription
        },
        formatResponse: { response, request in
            "⬇️ " + request.urlDescription + " " + response.responseDescription
        },
        formatHeaders: { headers in
            guard let headers = headers, !headers.isEmpty else { return nil }
            var result = "Headers: ["
            headers.forEach { key, value in
                result += "\n\t\(key) : \(value)"
            }
            result += "\n]"
            return result
        },
        formatBody: { body in
            guard let body = body, !body.isEmpty else { return nil }
            return "Body: \(body.prettyPrintedJSON)"
        }
    )
}
