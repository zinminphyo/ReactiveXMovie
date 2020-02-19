//
//  DetailViewController.swift
//  UserDefaultsTesting
//
//  Created by Zin Min on 19/02/2020.
//  Copyright © 2020 Zin Min. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire
import Kingfisher

class DetailViewController: UIViewController {

    let mModel : MovieModel = MovieModelImpl.shared
    let disposeBag : DisposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: String(describing: MovieTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MovieTableViewCell.self))
        
        let result = mModel.getMovie(movieName: "Joker")
        result.observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "MovieTableViewCell")){  index ,movie,cell in
                guard let movieCell = cell as? MovieTableViewCell else { return }
                movieCell.movieName.text = movie.title
                movieCell.movieDesc.text = movie.overview
                movieCell.movieImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w185\(movie.poster_path)"))
        }
    .disposed(by: disposeBag)

        
    }


}

