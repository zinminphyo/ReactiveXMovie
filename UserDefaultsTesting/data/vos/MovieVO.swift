//
//  MovieVO.swift
//  UserDefaultsTesting
//
//  Created by Zin Min on 19/02/2020.
//  Copyright © 2020 Zin Min. All rights reserved.
//

import Foundation

class MovieVO : Codable {
    let popularity : Double
    let vote_count : Double
    let video : Bool
    let poster_path : String
    let id : Int
    let adult : Bool
    let backdrop_path : String
    let original_language : String
    let original_title : String
    let title : String
    let vote_average : Double
    let overview : String
    let release_date : String
    
    enum CodingKeys : String,CodingKey {
        case popularity = "popularity"
        case vote_count = "vote_count"
        case video = "video"
        case poster_path = "poster_path"
        case id = "id"
        case adult = "adult"
        case backdrop_path = "backdrop_path"
        case original_language = "original_language"
        case original_title = "original_title"
        case title = "title"
        case vote_average = "vote_average"
        case overview = "overview"
        case release_date = "release_date"
    }
}
