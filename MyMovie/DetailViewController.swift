//
//  DetailViewController.swift
//  MyMovie
//
//  Created by Jinho Choi on 2020/08/09.
//  Copyright © 2020 Jinho Choi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var movieTitleName : String?
    var movieScore : Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DetailViewController 가 보일때 select cell 데이터값을 받아서 ui를 띄우는 메소드
        updateUI()
    }
    
    func updateUI(){
        if let getMovieTitle = self.movieTitleName, let getMovieScore = self.movieScore {
            
            let img = UIImage(named: "\(getMovieTitle).jpg")
            movieImage.image = img
            movieTitle.text = getMovieTitle
            myScore.text = "My Score is \(getMovieScore)"
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
