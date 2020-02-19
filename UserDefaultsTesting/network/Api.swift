//
//  Api.swift
//  UserDefaultsTesting
//
//  Created by Zin Min on 19/02/2020.
//  Copyright © 2020 Zin Min. All rights reserved.
//

import Foundation
import RxSwift

protocol Api {
    func getMovies(movieName:String) -> Observable<MovieResponse>
}
