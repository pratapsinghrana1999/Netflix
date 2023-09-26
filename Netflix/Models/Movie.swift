//
//  Movie.swift
//  Netflix
//
//  Created by Apple on 26/09/23.
//

import Foundation

struct TrendingMoviesResponse : Codable {
    let results : [Movie]
}

struct Movie : Codable {
    let id : Int
    let media_type : String?
    let title : String?
    let original_title : String?
    let poster_path : String?
    let overview : String?
    let vote_count : Int
    let release_date : String?
    let vote_average : Double
}
