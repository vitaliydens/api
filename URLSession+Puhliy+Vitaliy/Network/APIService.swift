//
//  APIService.swift
//  URLSession+Puhliy+Vitaliy
//
//  Created by Developer on 25.01.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation
class APIService{
    func loadRate(completionHandler: @escaping ([Rate]?, Error?) -> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.privatbank.ua"
        components.path = "/p24api/pubinfo"
        components.queryItems = [URLQueryItem(name: "exchange", value: nil),
                                 URLQueryItem(name: "json", value: nil),
                                 URLQueryItem(name: "coursid", value: "11")]
       
        guard let url = components.url else { return }
         print(url)
        URLSession
            .shared
            .dataTask(with: url) { data, response, error in
                print(response)
                if let data = data {
                    do {
                        let rates = try JSONDecoder().decode([Rate].self, from: data)
                        completionHandler(rates, nil)
                    } catch {
                        print(error.localizedDescription)
                        completionHandler(nil, error)
                    }
                }
        }.resume()
    }
    
    func loadBranches(searchString: String, completionHandler: @escaping ([Branch]?, Error?) -> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.privatbank.ua"
        components.path = "/p24api/pboffice"
        components.queryItems = [URLQueryItem(name: "json", value: nil),
                                 URLQueryItem(name: "city", value: searchString),
                                 URLQueryItem(name: "address", value: nil)]
        guard let url = components.url else { return }
        print(url)
        URLSession
            .shared
            .dataTask(with: url) { (data, response, error) in
                if let data = data {
                    do {
                        let branches = try JSONDecoder().decode([Branch].self, from: data)
                        completionHandler(branches, nil)
                    } catch {
                        print(error.localizedDescription)
                        completionHandler(nil, error)
                    }
                }
        }.resume()
    }
}
