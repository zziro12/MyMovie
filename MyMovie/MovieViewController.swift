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
    let movieTitleList = ["1917","Seven","BloodDiamond","Django","Fightclub","Memento","RememberTheTitans","ShutterIsland","Zootopia"]
    let myScoreList = [ 4.7, 4.8, 5, 4.4, 3.5 , 4.5, 3.2, 4.1,4.9]
    
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
        //UITableViewCell 이 아닌 CellList로 캐스팅해준다.
        
        //guard
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellList else{
            return UITableViewCell()
        }
        //guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellList
        //이 성립이 되면 아래 코드가 수행되고 아니면 위에 else 구문
        let img = UIImage(named: "\(movieTitleList[indexPath.row]).jpg")
        cell.movieImage.image = img
        cell.movieTitle.text = movieTitleList[indexPath.row]
        cell.myScore.text = "\(myScoreList[indexPath.row])"
        return cell
        
        //if let
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellList {
//            let img = UIImage(named: "\(movieTitleList[indexPath.row]).jpg")
//            cell.movieImage.image = img
//            cell.movieTitle.text = movieTitleList[indexPath.row]
//            cell.myScore.text = "\(myScoreList[indexPath.row])"
//            return cell
//        }else{
//            return UITableViewCell()
//        }
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
