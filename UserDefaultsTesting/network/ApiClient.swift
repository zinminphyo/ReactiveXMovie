//
//  ApiClient.swift
//  UserDefaultsTesting
//
//  Created by Zin Min on 19/02/2020.
//  Copyright © 2020 Zin Min. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class ApiClient : BaseApiClient{
    
    static let shared = ApiClient()
    private override init(){}
    
    
    
}
extension ApiClient : Api {
    
    func getMovies(movieName: String) -> Observable<MovieResponse> {
        let parameters : Parameters = [
            PARAM_API_KEY : API_KEY,
            PARAM_QUERY : movieName
        ]
        return requestApi(endpoint: PLAYING_MOVIE, method: .get, params: parameters, value: MovieResponse.self)
        
    }
    
    
}
