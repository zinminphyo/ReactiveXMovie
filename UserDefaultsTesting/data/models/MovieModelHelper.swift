//
//  MovieModelHelper.swift
//  UserDefaultsTesting
//
//  Created by Zin Min on 19/02/2020.
//  Copyright © 2020 Zin Min. All rights reserved.
//

import Foundation
import RxSwift


class MovieModelHelper : BaseModel {
    
    static let shared = MovieModelHelper()
    private override init() {
    }
    
    func getMovie(movieName:String) -> Observable<[MovieVO]>{
        mApiClient.getMovies(movieName: movieName)
            .map{ movieResponse in
                movieResponse.results}
            .catchError { (error) -> Observable<[MovieVO]> in
                debugPrint(error.localizedDescription)
                return Observable.just([MovieVO]())
        }
    }
    
}
