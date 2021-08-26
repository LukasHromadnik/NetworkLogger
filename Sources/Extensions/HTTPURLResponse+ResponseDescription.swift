//
//  HTTPURLResponse+RequestLoggerDescription.swift
//  NetworkLogger
//
//  Created by Lukáš Hromadník on 21.08.2021.
//

import Foundation

extension HTTPURLResponse {
    private var statusCodeIcon: String {
        switch statusCode {
        case 100...199:
            return "ℹ️"

        case 200...299:
            return "✅"

        case 300...399:
            return "↪️"

        case 400...499:
            return "⚠️"

        case 500...599:
            return "❌"

        default:
            return ""
        }
    }

    var responseDescription: String {
        var elements = [statusCodeIcon, "\(statusCode)"]
        if let statusCodeDescription = statusCodes[statusCode] {
            elements.append(statusCodeDescription)
        }
        return "(" + elements.joined(separator: " ") + ")"
    }
}
