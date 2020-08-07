//
//  MovieViewController.swift
//  MyMovie
//
//  Created by Jinho Choi on 2020/08/07.
//  Copyright © 2020 Jinho Choi. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    //임시 데이터.  무비스코어는 더블타입 어레이
    let movieTitleList = ["Seven","Zootopia","lionking","타짜","내부자들","광해","공조","럭키"]
    let myScoreList = [ 4.7, 5, 3, 4.4, 3.5 , 4.5, 3.2, 2]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //MARKS : UITableViewDataSource protocol
    
    //UITableViewDataSource
    //몇개 보여줄거냐
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
        return movieTitleList.count
    }
    
    //어떻게 표현할건가     indexPath = 셀의 위치 표시
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    //MARKS : UITableViewDelegate
    //클릭했을때 어떻게 반응할 것인가 tableView 에 didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
}

class CellList : UITableViewCell {
    @IBOutlet weak var movieImage : UIImageView!
    @IBOutlet weak var movieTitle : UILabel!
    @IBOutlet weak var myScore : UILabel!
    
}
