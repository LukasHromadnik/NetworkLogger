//
//  DataTaskPublisher+Log.swift
//  NetworkLogging
//
//  Created by Lukáš Hromadník on 22.08.2021.
//

import Combine
import Foundation

public extension URLSession.DataTaskPublisher {
    func log(
        logLevel: RequestLogLevel = .full,
        formatter: Formatter = .default,
        logger: Logger = .print
    ) -> Publishers.HandleEvents<Self> {
        handleEvents(
            receiveSubscription: { _ in
                if logLevel.contains(.url), let formattedRequest = formatter.formatRequest(request) {
                    logger.log(formattedRequest)
                }

                if logLevel.contains(.headers), let formattedHeaders = formatter.formatHeaders(request.allHTTPHeaderFields) {
                    logger.log(formattedHeaders)
                }

                if logLevel.contains(.body), let formattedBody = formatter.formatBody(request.httpBody) {
                    logger.log(formattedBody)
                }
            },
            receiveOutput: { data, response in
                guard let response = response as? HTTPURLResponse else { return }

                if logLevel.contains(.url), let formattedResponse = formatter.formatResponse(response, request) {
                    logger.log(formattedResponse)
                }

                if logLevel.contains(.headers), let formattedHeaders = formatter.formatHeaders(response.allHeaderFields) {
                    logger.log(formattedHeaders)
                }

                if logLevel.contains(.body), let formattedBody = formatter.formatBody(data) {
                    logger.log(formattedBody)
                }
            }
        )
    }
}
