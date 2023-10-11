//
//  APIService.swift
//  MedBook
//
//  Created by Raj Raval on 10/10/23.
//

import Foundation

enum Endpoint {
    case countries
    
    var path: String {
        switch self {
        case .countries:
            return "countries"
        }
    }
    
    var baseURL: URL {
        return URL(string: "https://api.first.org/data/v1")!
    }
    
    var url: URL {
        switch self {
        case .countries:
            return baseURL.appendingPathComponent(path)
        }
    }
}

enum APIError {
    case decodingError
    case unknownError
}

class APIService {
    
    static let shared = APIService()
    
    private init() {}
    
    func fetchZenData<T: Codable>(for endpoint: Endpoint, for date: Date =  .now) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: endpoint.url)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    
}
