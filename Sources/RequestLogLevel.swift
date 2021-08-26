//
//  RequestLogLevel.swift
//  NetworkLogger
//
//  Created by Lukáš Hromadník on 21.08.2021.
//

import Foundation

public struct RequestLogLevel: OptionSet {
    public let rawValue: UInt8
    public static let none: RequestLogLevel = []
    public static let url = RequestLogLevel(rawValue: 1)
    public static let headers = RequestLogLevel(rawValue: 0b11)
    public static let body = RequestLogLevel(rawValue: 0b101)
    public static let full: RequestLogLevel = [.url, .headers, .body]

    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}
