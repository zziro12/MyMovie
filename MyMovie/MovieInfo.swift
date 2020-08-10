//
//  MovieInfo.swift
//  MyMovie
//
//  Created by Jinho Choi on 2020/08/10.
//  Copyright © 2020 Jinho Choi. All rights reserved.
//

import UIKit

struct MovieInfo {
    let movieTitle : String
    let myScore : Double
    
    var image : UIImage? {
        return UIImage(named: "\(movieTitle).jpg")
    }
    
    init(movieTitle : String, myScore : Double) {
        self.movieTitle = movieTitle
        self.myScore = myScore
    }
}
