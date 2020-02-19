//
//  MovieModelImpl.swift
//  UserDefaultsTesting
//
//  Created by Zin Min on 19/02/2020.
//  Copyright © 2020 Zin Min. All rights reserved.
//

import Foundation
import RxSwift

class MovieModelImpl : MovieModel{
    
    static let shared : MovieModel = MovieModelImpl()
    let mHelper = MovieModelHelper.shared
    private init(){}
    
    func getMovie(movieName: String) -> Observable<[MovieVO]> {
        return mHelper.getMovie(movieName: movieName)
    }
    
    
    
    
}
