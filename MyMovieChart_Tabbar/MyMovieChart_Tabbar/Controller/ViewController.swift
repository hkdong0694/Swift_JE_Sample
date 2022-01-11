//
//  ViewController.swift
//  MyMovieChart_Tabbar
//
//  Created by KyungDong Han on 2022/01/11.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var list : [MovieVO] = {
        var dataList = [MovieVO]()
        return dataList
    }()
    
    var page = 1

    override func viewDidLoad() {
        self.callAPI()
    }
    
    // OpenAPI 호출 Method
    fileprivate func callAPI() {
        
        // 호핀 API 호출을 위한 URI 생성
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=30&genreId=&order=releasedateasc"
        let apiURL : URL! = URL(string: url)
        
        let apiData = try! Data(contentsOf: apiURL)
        
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apiData, options: []) as! NSDictionary
            
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
            }
        } catch {
        }
    }
}

// MARK: - UITableViewDataSource 프로토콜 구현
extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(String(describing: row.rating!))"
        
        DispatchQueue.main.async {
            cell.thumbnail.image = self.getThumbnailImage(index: indexPath.row)
        }
        
        return cell
    }
    
    // 이미지 썸네일 가져오기
    func getThumbnailImage( index : Int) -> UIImage {
        
        let mvo = self.list[index]
        
        if let savedImages = mvo.thumbnailImage {
            return savedImages
        } else {
            let url: URL! = URL(string: mvo.thumbnail!)
            let imageData = try! Data(contentsOf: url)
            mvo.thumbnailImage = UIImage(data: imageData)
            
            return mvo.thumbnailImage!
        }
    }
}


extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

