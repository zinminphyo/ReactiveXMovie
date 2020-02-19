//
//  MovieResponse.swift
//  UserDefaultsTesting
//
//  Created by Zin Min on 19/02/2020.
//  Copyright © 2020 Zin Min. All rights reserved.
//

import Foundation

class MovieResponse : Codable {
    
    let results : [MovieVO]
    
    enum CodingKeys : String,CodingKey {
        case results = "results"
    }
}
