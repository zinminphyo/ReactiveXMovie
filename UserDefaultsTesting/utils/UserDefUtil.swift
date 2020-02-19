//
//  UserDefUtil.swift
//  UserDefaultsTesting
//
//  Created by Zin Min on 19/02/2020.
//  Copyright © 2020 Zin Min. All rights reserved.
//

import Foundation

class UserDefUtil {
    
    static let shared = UserDefUtil()
    
    private init(){}
    
    func saveIsLogin(isLogin:Bool){
        UserDefaults.standard.set(isLogin, forKey: USER_DEF_IS_LOGIN)
    }
    func getUserLogin() -> Bool {
        UserDefaults.standard.bool(forKey: USER_DEF_IS_LOGIN)
    }
    
    
}
