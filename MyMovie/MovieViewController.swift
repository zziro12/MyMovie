//
//  MovieViewController.swift
//  MyMovie
//
//  Created by Jinho Choi on 2020/08/07.
//  Copyright © 2020 Jinho Choi. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout{
   
    //MARKS : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
    //UICollectionViewDataSource
    //몇개를 보여줄것인지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfMovieInfoList
    }
    
    //셀을 어떻게 표현할것인지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else {
            return UICollectionViewCell()
        }
        let movieInfo = viewModel.movieInfo(at: indexPath.item)
        cell.setCellUI(info: movieInfo)
        return cell
    }
    
    //UICollectionViewDelegate
    //셀이 클릭되었을때 어떻게 할것인지
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieInfo = viewModel.movieInfo(at: indexPath.row)
        print("\(movieInfo.movieTitle) 디테일 보기")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
    
    //UICollectionViewDelegateFlowLayout
    //디바이스마다 셀의 사이즈가 조금씩 달라지기때문에 각 디바이스 마다 균형잡힌 레이아웃을 설정해 주기위해 계산
    //셀 사이즈 계산 (다양한 디바이스에서 일관적인 디자인을 보여주기 위해서)
    //전체 컬렉션뷰 너비에서 셀간의 간격을 빼고 나누기 2하면 너비를 구할수 있을듯
    //구한너비에 따라서 이미지뷰는 7:10정도 너비를 주고 레이블쪽 구간은 65정도로 고정된 높이 줄것
    
    
    
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
    
class GridCell : UICollectionViewCell {
    @IBOutlet weak var movieImage : UIImageView!
    @IBOutlet weak var movieTitle : UILabel!
    @IBOutlet weak var myScore : UILabel!
    
    func setCellUI(info : MovieInfo) {
        movieImage.image = info.image
        movieTitle.text = info.movieTitle
        myScore.text = "\(info.myScore)"
    }
}


