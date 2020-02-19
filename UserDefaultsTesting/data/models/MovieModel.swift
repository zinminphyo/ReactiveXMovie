//
//  MovieModel.swift
//  UserDefaultsTesting
//
//  Created by Zin Min on 19/02/2020.
//  Copyright © 2020 Zin Min. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire


protocol MovieModel {
    
    func getMovie(movieName:String) -> Observable<[MovieVO]>
        
}
