//
//  Logger.swift
//  NetworkLogging
//
//  Created by Lukáš Hromadník on 22.08.2021.
//

import Foundation

public struct Logger {
    public let log: (String) -> Void
}

public extension Logger {
    static var print = Logger(
        log: { Swift.print($0) }
    )
}
