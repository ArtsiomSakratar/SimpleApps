//
//  MoviesService.swift
//  MoviesDB
//
//  Created by Artsiom Sakratar on 9/1/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

class MoviesService: NSObject {
    static let shared = MoviesService()
    
    weak var networkService = NetworkService.shared
    
    func getMovies(completion: @escaping(Result<MoviesList, Error>)->Void) {
        let api = "\(NetworkConfig.shared.baseUrl)discover/movie?api_key=\(NetworkConfig.shared.apiKey)&page=1&sort_by=popularity.desc"
        self.networkService?.request(url: api, parameters: [:], method: .get, completion: { (result: Result<MoviesList, Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                print("success")
            }
            completion(result)
        })
    }
    
    func search(query: String, completion: @escaping(Result<MoviesList, Error>)->Void) {
        let api = "\(NetworkConfig.shared.baseUrl)search/movie?api_key=\(NetworkConfig.shared.apiKey)&query=\(query)&page=1"
        self.networkService?.request(url: api, parameters: [:], method: .get, completion: { (result: Result<MoviesList, Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                print("success")
            }
            completion(result)
        })
    }
}
