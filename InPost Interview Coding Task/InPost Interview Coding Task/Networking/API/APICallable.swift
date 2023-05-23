//
//  APICallable.swift
//  InPost Interview Coding Task
//
//  Created by Mehmet Tarhan on 23/05/2023.
//

import Foundation
import UIKit

protocol APICallable {
    /// Decoder to decode API responses. Date Decoding is .iso8601
    var decoder: JSONDecoder { get }
    /// URL session instance to retrive data from a URL instance
    var session: URLSession { get }
}

extension APICallable {
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .useDefaultKeys // If API response is in snake case use: .convertFromSnakeCase

        return decoder
    }

    var session: URLSession {
        URLSession.shared
    }
}
