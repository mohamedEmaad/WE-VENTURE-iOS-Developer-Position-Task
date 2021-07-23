//
//  File.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//
import Foundation

final class RequestFetcher: RequestHandler {

    private var headers: [String: String]?
    private var lastTask: URLSessionDataTask?

    init(headers: [String: String]?) {
        self.headers = headers
    }

    func execute(url: URL, requestType: RequstType, body: Data?, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.lastTask?.cancel()
        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue

        (self.headers ?? [:]).forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }

        self.lastTask = URLSession.shared.dataTask(with: request, completionHandler: completion)
        lastTask?.resume()
    }

}
