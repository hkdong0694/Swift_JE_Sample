//
//  ListViewController.swift
//  MyMovieChart_OpenAPI
//
//  Created by KyungDong Han on 2022/01/05.
//

import UIKit

class ListViewController : UITableViewController {
    
    @IBOutlet var moreBtn: UIButton!
    
    lazy var list : [MovieVO] = {
        var dataList = [MovieVO]()
        return dataList
    }()
    // 현재까지 읽어온 데이터의 페이지 정보
    var page = 1
    
    override func viewDidLoad() {
        
        self.callMovieAPI()
        
    }
    
    func callMovieAPI() {
        // 호핀 API 호출을 위한 URI 생성
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=10&genreId=&order=releasedateasc"
        let apiUri: URL! = URL(string: url)
        
        // REST API을 호출
        let apidata = try! Data(contentsOf: apiUri)
        
        // 데이터 전송 결과를 로그로 출력 ( 반드시 필요한 코드는 아님 )
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? ""
        NSLog("API RESUlt = \( log )")
        
        // JSON 객체를 파싱하여 NsDictionary 객체로 받음
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            // 데이터 구조에 따라 차례대로 캐스팅하며 읽어온다.
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            
            let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
        
            
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
                
                // list 배열에 추가
                self.list.append(mvo)
                
                if(self.list.count >= totalCount) {
                    self.moreBtn.isHidden = true
                }
                
            }
            
        } catch {
            
        }
    }
    
    @IBAction func more(_ sender: Any) {
        self.page += 1
        
        
        self.callMovieAPI()
        
        self.tableView.reloadData()
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        
        // 섬네일 경로를 인자값으로 하는 URL 객체를 생성
        let url : URL! = URL(string: row.thumbnail!)
        
        // 이미지를 읽어와 Data 객체에 저장
        let imageData = try! Data(contentsOf: url)
        
        // UIImage 객체를 생성하여 아울렛 변수의 image 속성에 대입
        cell.thumnail.image = UIImage(data: imageData)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("\(indexPath.row) 번째 행 클릭!")
    }

    
}
