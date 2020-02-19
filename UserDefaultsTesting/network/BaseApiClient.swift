//
//  BaseApiClient.swift
//  UserDefaultsTesting
//
//  Created by Zin Min on 19/02/2020.
//  Copyright © 2020 Zin Min. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class BaseApiClient {
    
    let decoder = JSONDecoder()
    
    public func requestApi<T>(
        endpoint:String,
        method:HTTPMethod,
        params:Parameters,
        encoding:ParameterEncoding = URLEncoding.default,
        value:T.Type) -> Observable<T> where T : Codable {
        
        return Observable.create{ observer -> Disposable in
            
            let request = Alamofire.request(BASE_URL+endpoint, method: method, parameters: params, encoding: encoding, headers: [:])
                .responseJSON{ response in
                    switch response.result {
                    case .success :
                        if 200...299 ~= response.response?.statusCode ?? 500 {
                            if let data = response.data {
                                do {
                                    let movieResponse =  try self.decoder.decode(T.self, from: data)
                                    observer.onNext(movieResponse)
                                } catch let error {
                                    observer.onError(error)
                                }
                            }
                            
                        }else {
                            observer.onError(NSError(domain: "SOMETHING WENT WRONG", code: response.response?.statusCode ?? 500, userInfo: nil))
                        }
                        
                    case .failure(let error):
                        debugPrint(error.localizedDescription)
                        let errorMessage = response.error?.localizedDescription ?? "PLEASE CHECK INTERNET CONNECTION"
                        observer.onError(NSError(domain: errorMessage, code: response.response?.statusCode ?? 500, userInfo: nil))
                        
                    }
            }
            return Disposables.create(with: request.cancel)
            
        }
         
    }
    
    
}
