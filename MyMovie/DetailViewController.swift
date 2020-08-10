//
//  DetailViewController.swift
//  MyMovie
//
//  Created by Jinho Choi on 2020/08/09.
//  Copyright © 2020 Jinho Choi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //MVVM
    
    //Model
    // - MovieInfo
    // > MovieInfo 만들기
    
    //View
    // -movieImage,movieTitle, myScore
    // view들은 viewModel통해서 구성되기
    
    //ViewModel
    // - MovieViewModel
    // > MovieViewModel을 만들고 뷰레이어에서 필요한 메서드 만들기
    // > 모델가지고 있기 ,, MovieInfo 등
    
    var movieInfo : MovieInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DetailViewController 가 보일때 select cell 데이터값을 받아서 ui를 띄우는 메소드
        updateUI()
    }
    
    func updateUI(){
        if let movieInfo = self.movieInfo {
            movieImage.image = movieInfo.image
            movieTitle.text = movieInfo.movieTitle
            myScore.text = "My Score is \(movieInfo.myScore)"
        }
    }
    
    @IBAction func close(_ sender: Any) {
        //사라지는 메소드
        //completion는 사라지고나서 수행되야될 메소드 같은거 넣는곳
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var movieImage : UIImageView!
    @IBOutlet weak var movieTitle : UILabel!
    @IBOutlet weak var myScore : UILabel!
    
    
}
