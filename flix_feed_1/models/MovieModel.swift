//
//  MovieModel.swift
//  flix_feed_1
//
//  Created by Tu Pham on 10/7/18.
//  Copyright © 2018 Van Lao. All rights reserved.
//

import Foundation
class MovieModel{
    var title: String
    var Overview: String
    var ReleaseDate: String
    var posterUrl: URL?
    var backdropUrl: URL?
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as! String
        Overview = dictionary["overview"] as? String ?? "no overview"
        ReleaseDate = dictionary["release_date"] as? String ?? "no release date"
        let PosterPathString = dictionary["poster_path"] as? String ?? "no poster"
        let BackDropPathString = dictionary["backdrop_path"] as? String ?? "no backdrop"
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        posterUrl = URL(string: baseURLString + PosterPathString)!
        backdropUrl = URL(string: baseURLString + BackDropPathString)!
        // Set the rest of the properties
    }
    
    class func movies(dictionaries: [[String: Any]]) -> [MovieModel] {
        var movies: [MovieModel] = []
        for dictionary in dictionaries {
            let movie = MovieModel(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}


