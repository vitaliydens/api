//
//  APIService.swift
//  URLSession+Puhliy+Vitaliy
//
//  Created by Developer on 25.01.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Moya

enum APIService {
    case getRate
    case getBranches(serchSrting: String)
}

extension APIService: TargetType {
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var method: Method {
        .get
    }
    
    var baseURL: URL {
        return URL(string: "https://api.privatbank.ua/p24api/")!
    }

    var path: String {
        switch self {
        case .getRate:
            return "pubinfo"
        case .getBranches:
            return "pboffice"
        }
    }

    var task: Task {
        switch self {
        case .getRate:
            return .requestParameters(parameters: ["exchange": "",
                                                   "json": "",
                                                   "coursid": "11"],
                                      encoding: URLEncoding.queryString)
        case .getBranches(serchSrting: let search):
            return .requestParameters(parameters: ["json": "",
                                                   "city": search,
                                                   "address": ""],
                                      encoding: URLEncoding.queryString)
        }
    }
}
