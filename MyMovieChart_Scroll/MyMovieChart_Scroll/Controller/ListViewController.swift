//
//  ListViewController.swift
//  MyMovieChart_Scroll
//
//  Created by KyungDong Han on 2022/01/06.
//

import UIKit
class ListViewController : UITableViewController {
   
    lazy var list : [MovieVO] = {
        var dataList = [MovieVO]()
        return dataList
    }()
    
    var page = 1
    
    override func viewDidLoad() {
        self.callMovieAPI()
    }
    
    fileprivate func callMovieAPI() {
        // 호핀 API 호출을 위한 URI 생성
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=30&genreId=&order=releasedateasc"
        
        let apiURl: URL! = URL(string: url)
        
        let apidata = try! Data(contentsOf: apiURl)
        
        // JSON 객체를 파싱하여 NsDictionary 객체로 받음
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            // 데이터 구조에 따라 차례대로 캐스팅하며 읽어온다.
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
                        
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            // Interator 처리를 하면서 API 데이터를 MovieVO 객체에 저장한다.
            for row in movie {
                // 순회 상수를 NSDictionary 타입으로 캐스팅
                let r = row as! NSDictionary
                
                // 테이블 뷰 리스트를 구성할 데이터 형식
                let mvo = MovieVO()
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                
                // 섬네일 경로를 인자값으로 하는 URL 객체를 생성
                let url : URL! = URL(string: mvo.thumbnail!)
                
                // 이미지를 읽어와 Data 객체에 저장
                let imageData = try! Data(contentsOf: url)
                mvo.thumbnailImage = UIImage(data: imageData)
                
                // list 배열에 추가
                self.list.append(mvo)
                
                // if(self.list.count >= totalCount) {
                //     self.moreBtn.isHidden = true
                // }
                
            }
            
        } catch {
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        
        // 비동기 방식으로 섬네일 이미지를 읽어온다.
        DispatchQueue.main.async {
            cell.thumbnail.image = self.getThumbnailImage(indexPath.row)
        }
        
        NSLog("제목 : \(row.title!), 호출된 행번호 : \(indexPath.row)")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Click Event
    }
    
    func getThumbnailImage(_ index: Int) -> UIImage {
        
        let mvo = self.list[index]
        
        if let savedImage = mvo.thumbnailImage {
            return savedImage
        } else {
            let url: URL! = URL(string: mvo.thumbnail!)
            let imageData = try! Data(contentsOf: url)
            mvo.thumbnailImage = UIImage(data: imageData)
            
            return mvo.thumbnailImage!
        }
        
    }
    
    
}
