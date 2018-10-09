//
//  movieAPIManager.swift
//  flix_feed_1
//
//  Created by Tu Pham on 10/8/18.
//  Copyright © 2018 Van Lao. All rights reserved.
//

import Foundation

class movieAPIManager {
    static let baseUrl = "https://api.themoviedb.org/3/movie/"
    static let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
    var session: URLSession
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func nowPlayingMovies(completion: @escaping ([MovieModel]?, Error?) -> ()) {
        let url = URL(string: movieAPIManager.baseUrl + "now_playing?api_key=\(movieAPIManager.apiKey)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movieDictionaries = dataDictionary["results"] as! [[String: Any]]
                
                let movies = MovieModel.movies(dictionaries: movieDictionaries)
                completion(movies, nil)
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
    //get the popular movies.
    func popularMovies(completion: @escaping ([MovieModel]?, Error?) -> ()){
        let url = URL(string: movieAPIManager.baseUrl + "popular?api_key=\(movieAPIManager.apiKey)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movieDictionaries = dataDictionary["results"] as! [[String: Any]]
                
                let movies = MovieModel.movies(dictionaries: movieDictionaries)
                completion(movies, nil)
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
