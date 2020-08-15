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
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DetailViewController 가 보일때 select cell 데이터값을 받아서 ui를 띄우는 메소드
        updateUI()
        prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    //scale 크기 3배, 180도 돌려놓는다
    private func prepareAnimation() {
        movieTitle.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        myScore.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        //투명도 조절 0 =  안보이게
        movieTitle.alpha = 0
        myScore.alpha = 0
    }
    
    private func showAnimation() {
        //CGAffineTransform 변형을 가하는데 identity 변형을 가하기전모습
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.2, options: .allowUserInteraction, animations: {
            self.movieTitle.transform = CGAffineTransform.identity
            //투명도 조절 1 =  보이게
            self.movieTitle.alpha = 1
            
        }, completion: nil)
        UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.2, options: .allowUserInteraction, animations: {
            self.myScore.transform = CGAffineTransform.identity
            //투명도 조절 1 =  보이게
            self.myScore.alpha = 1
        }, completion: nil)
                
        UIView.transition(with: movieImage, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        
    }
    
    func updateUI(){
        if let movieInfo = viewModel.movieInfo {
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
    
    @IBOutlet weak var movieTitleLabelCenterX: NSLayoutConstraint!
    
    @IBOutlet weak var myScoreLabelCenterX: NSLayoutConstraint!
    
}

class DetailViewModel {
    var movieInfo : MovieInfo?
    
    func update(model : MovieInfo?){
        movieInfo = model
    }
}
