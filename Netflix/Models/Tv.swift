//
//  Tv.swift
//  Netflix
//
//  Created by Apple on 26/09/23.
//

import Foundation

struct TvResponse : Codable {
    let results : [Tv]
}

struct Tv : Codable {
    let id : Int
    let media_type : String?
    let name : String?
    let original_name : String?
    let overview : String?
    let poster_path : String?
    let vote_count : Int
    let vote_average : Double
}
