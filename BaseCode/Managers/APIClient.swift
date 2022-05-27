//
//  APIClient.swift
//  zytrack_ios
//
//  Created by BrainX Technologies on 3/1/21.
//

import Alamofire
import Foundation

protocol HTTPRequest {
    var endPoint: URL? { get }

    var method: HTTPMethod { get }

    var parameters: Parameters? { get }

    var headers: HTTPHeaders? { get }
}

extension HTTPRequest {
    var parameters: Parameters? { nil }

    var headers: HTTPHeaders? { nil }
}

typealias APIClientResult = Result<Any, AppError>

class APIClient {
    // MARK: - Class Instances

    static let shared = APIClient()

    // MARK: - Initializers

    private init() {}

    // MARK: - Public Methods

    func performRequest(_ request: HTTPRequest, shouldAddHeader: Bool = true, andCompletion completion: @escaping (APIClientResult) -> Void) {
        guard let url = request.endPoint else {
            completion(.failure(AppError(message: LocalizedKey.urlNotFound.string)))
            return
        }
        var headers: HTTPHeaders?
        if shouldAddHeader {
            // if access_token is required add here
            headers = []
            request.headers?.forEach { headers?.add($0) }
        }

        let parameterEncoding: ParameterEncoding = request.method == .get ? URLEncoding() : JSONEncoding()

        AF.session.configuration.timeoutIntervalForRequest = 120
        AF.session.configuration.waitsForConnectivity = true
        AF.request(
            url, method: request.method,
            parameters: request.parameters,
            encoding: parameterEncoding,
            headers: headers
        ).responseJSON { response in
            let headers = response.response?.allHeaderFields ?? [:]
            switch response.result {
            case let .success(value):
                completion(.success((headers: headers, body: value, code: response.response?.statusCode ?? AppConstants.errorCode)))
            case let .failure(error):
                completion(.failure(AppError(message: error.errorDescription ??
                        LocalizedKey.somethingWentWrong.string, code: error.responseCode ?? AppConstants.errorCode)))
            }
        }
    }

    func downloadRequest(_ request: HTTPRequest, shouldAddHeader: Bool = true, andCompletion completion: @escaping (APIClientResult) -> Void) {
        let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)

        guard let url = request.endPoint else {
            completion(.failure(AppError(message: LocalizedKey.urlNotFound.string)))
            return
        }
        var headers: HTTPHeaders?
        if shouldAddHeader {
            // if access_token is required add here
            headers = []
            request.headers?.forEach { headers?.add($0) }
        }

        let parameterEncoding: ParameterEncoding = request.method == .get ? URLEncoding() : JSONEncoding()

        AF.download(
            url,
            method: request.method,
            parameters: request.parameters,
            encoding: parameterEncoding,
            headers: headers,
            to: destination
        ).downloadProgress(closure: { _ in

        }).response(completionHandler: { DefaultDownloadResponse in
            switch DefaultDownloadResponse.result {
            case let .success(value):
                completion(.success((headers: headers, body: value, code: DefaultDownloadResponse.response?.statusCode ?? AppConstants.errorCode)))
            case let .failure(error):
                completion(.failure(AppError(message: error.errorDescription ??
                                             LocalizedKey.somethingWentWrong.string, code: error.responseCode ?? AppConstants.errorCode)))
            }
        })
    }
}
