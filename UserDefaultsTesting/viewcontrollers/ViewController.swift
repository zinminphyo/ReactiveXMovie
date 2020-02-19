//
//  ViewController.swift
//  UserDefaultsTesting
//
//  Created by Zin Min on 19/02/2020.
//  Copyright © 2020 Zin Min. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtUserPassword: UITextField!
    let disposeBag : DisposeBag = DisposeBag()
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userNameObservable = txtUserName.rx.text
        let userPasswordObservable = txtUserPassword.rx.text
        
        Observable.combineLatest(userNameObservable,userPasswordObservable){ userName,password -> Bool in
            return (!(userName?.isEmpty ?? false)) && (!(password?.isEmpty ?? false))
        }.subscribe(onNext:{ isValid in
            isValid ? self.enableLoginButton() : self.disableLoginButton()
        })
        .disposed(by: disposeBag)
    }
    
    func enableLoginButton() {
        self.btnLogin.isUserInteractionEnabled = true
        self.btnLogin.backgroundColor = UIColor.yellow
    }
    func disableLoginButton(){
        self.btnLogin.isUserInteractionEnabled = false
        self.btnLogin.backgroundColor = UIColor.white
    }
    
    @IBAction func didTapBtnLogin(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as! DetailViewController
        self.present(destinationVC, animated: true, completion: nil)
        UserDefUtil.shared.saveIsLogin(isLogin: true)
    }
    

}



