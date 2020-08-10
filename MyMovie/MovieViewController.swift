//
//  MovieViewController.swift
//  MyMovie
//
//  Created by Jinho Choi on 2020/08/07.
//  Copyright © 2020 Jinho Choi. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    //MVVM
    
    //Model
    // - MovieInfo
    // > MovieInfo 만들기
    
    //View
    // - CellList
    // > CellList필요한 정보를 ViewModel에서 받기
    // > CellList은 ViewModel로부터 받은 정보로 뷰 업데이트하기
    
    //ViewModel
    // - MovieViewModel
    // > MovieViewModel을 만들고 뷰레이어에서 필요한 메서드 만들기
    // > 모델가지고 있기 ,, MovieInfo 등
    
    let viewModel = MovieViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //DetailViewController에게 데이터 전송
        if segue.identifier == "showDetail"{
            let vc = segue.destination as? DetailViewController
            
            if let index = sender as? Int{
                let movieInfo = viewModel.movieInfo(at: index)
                vc?.viewModel.update(model: movieInfo)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARKS : UITableViewDataSource protocol
    
    //UITableViewDataSource
    //몇개 보여줄거냐
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numOfMovieInfoList
    }
    
    //어떻게 표현할건가     indexPath = 셀의 위치 표시
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //UITableViewCell 이 아닌 CellList로 캐스팅해준다.
        
        //guard
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellList else{
            return UITableViewCell()
        }
        //이 성립이 되면 아래 코드가 수행되고 아니면 위에 else 구문
        let movieInfo = viewModel.movieInfo(at: indexPath.row)
        cell.setCellUI(info: movieInfo)
        return cell
    }
    
    //MARKS : UITableViewDelegate
    //클릭했을때 어떻게 반응할 것인가 tableView 에 didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieInfo = viewModel.movieInfo(at: indexPath.row)
        print("\(movieInfo.movieTitle) 디테일 보기")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}

class CellList : UITableViewCell {
    @IBOutlet weak var movieImage : UIImageView!
    @IBOutlet weak var movieTitle : UILabel!
    @IBOutlet weak var myScore : UILabel!
    
    func setCellUI(info : MovieInfo) {
        movieImage.image = info.image
        movieTitle.text = info.movieTitle
        myScore.text = "\(info.myScore)"
    }
}



class MovieViewModel {
    let movieInfoList : [MovieInfo] = [
    MovieInfo(movieTitle: "1917", myScore: 4.7),
    MovieInfo(movieTitle: "Seven", myScore: 4.8),
    MovieInfo(movieTitle: "BloodDiamond", myScore: 5),
    MovieInfo(movieTitle: "Django", myScore: 4.4),
    MovieInfo(movieTitle: "Fightclub", myScore: 3.5),
    MovieInfo(movieTitle: "Memento", myScore: 4.5),
    MovieInfo(movieTitle: "RememberTheTitans", myScore: 3.2),
    MovieInfo(movieTitle: "ShutterIsland", myScore: 4.1),
    MovieInfo(movieTitle: "Zootopia", myScore: 4.9),
    ]
    
    var numOfMovieInfoList : Int {
        return movieInfoList.count
    }
    
    var sortedList : [MovieInfo] {
        let sortedList = movieInfoList.sorted { prev, next in
            return prev.myScore > next.myScore
        }
        return sortedList
    }
    
    func movieInfo(at index : Int) -> MovieInfo {
        return sortedList[index]
    }
}
