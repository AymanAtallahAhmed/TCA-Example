//
//  NetworkManager.swift
//  TCATask
//
//  Created by Ayman Atallah on 25/05/2024.
//

import Alamofire

final actor NetworkManager {
    func request<T: Decodable>(
        method: HTTPMethod,
        url: String,
        headers: [String: String],
        params: Parameters?,
        of type: T.Type
    ) async throws -> T {
        var encoding: ParameterEncoding = JSONEncoding.default
        switch method {
        case .post:
            encoding = JSONEncoding.default
        case .get:
            encoding = URLEncoding.default
        default:
            encoding = JSONEncoding.default
        }

        return try await withCheckedThrowingContinuation { continuation in
            AF.request(
                url,
                method: method,
                parameters: params,
                encoding: encoding,
                headers: HTTPHeaders(headers)
            ).responseDecodable(of: type) { response in
                switch response.result {
                case let .success(data):
                    continuation.resume(returning: data)

                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
