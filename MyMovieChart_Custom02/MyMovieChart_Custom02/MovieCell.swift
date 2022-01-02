//
//  MovieCell.swift
//  MyMovieChart_Custom02
//
//  Created by KyungDong Han on 2022/01/02.
//

import UIKit
class MovieCell : UITableViewCell {
    
    @IBOutlet var title: UILabel!   // 영화 제목
    
    @IBOutlet var desc: UILabel!    // 영화 설명
    
    @IBOutlet var opendate: UILabel! // 영화 개봉 날짜
    
    @IBOutlet var rating: UILabel! // 영화 평점
    
    @IBOutlet var thumbnail: UIImageView! // 영화 섬네일
}
