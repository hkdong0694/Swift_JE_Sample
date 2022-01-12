//
//  TheaterListController.swift
//  MyMovieCahrt_AutoLayout
//
//  Created by KyungDong Han on 2022/01/12.
//

import UIKit

class TheaterListController : UITableViewController {

    lazy var list = [NSDictionary]()
    
    var startPoint = 0
    
    override func viewDidLoad() {
        self.callOpenAPI()
    }
    
    
    // OpenAPI 호출
    fileprivate func callOpenAPI() {
        // URL 을 구성하기 위한 상수값을 선언한다.
        let requestURL = "http://swiftapi.rubypaper.co.kr:2029/theater/list" // API 요청 주소
        
        let sList = 100
        let type = "json"
        
        // 인자값들을 모아 URL 객체로 정의한다
        let urlObj = URL(string: "\(requestURL)?s_page=\(self.startPoint)&s_list=\(sList)&type=\(type)")
        
        do {
            // NSString 객체를 이용하여 API를 호출하고 그 결과값을 인코딩된 문자열로 받아온다.
            let stringdata = try NSString(contentsOf: urlObj!, encoding: 0x80_000_422)
            // 문자열로 받은 데이터를 UTF-8 로 인코딩처리한 Data로 변환한다.
            let encdata = stringdata.data(using: String.Encoding.utf8.rawValue)
            
            do {
                // Data 객체를 파싱하여 NSArray 객체로 변환한다.
                let apiArray = try JSONSerialization.jsonObject(with: encdata!, options: []) as? NSArray
                
                for obj in apiArray! {
                    self.list.append(obj as! NSDictionary)
                }
                
            } catch {
                alert1("데이터 분석이 실패하였습니다.", onClick: nil)
            }
            
            self.startPoint += sList
            
        } catch {
            alert1("데이터를 불러오는데 실패하였습니다.", onClick: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_map" {
            
            // 선택된 셀의 행 정보
            let path = self.tableView.indexPath(for: sender as! UITableViewCell)
            // 선택된 셀에 사용된 데이터
            let data = self.list[path!.row]
            
            // 세그웨이가 이동할 목적지 뷰 컨트롤러 객체를 구하고, 선언된 param 변수에 데이터를 연결한다..??
            (segue.destination as? TheaterViewController)?.param = data
            
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tCell") as! TheaterCell
        
        cell.name?.text = row["상영관명"] as? String
        cell.tel?.text = row["연락처"] as? String
        cell.addr?.text = row["소재지도로명주소"] as? String
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @IBAction func moreBtn(_ sender: Any) {
        self.callOpenAPI()
        // 데이터 목록 reload
        self.tableView.reloadData()
    }
    
}


extension TheaterListController {
    
    func alert1(_ message : String, onClick: (() -> Void)? = nil)  {
        
        let controller = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        controller.addAction(UIAlertAction(title: "OK", style: .cancel){
            (_) in
            onClick?()
        })
        
        DispatchQueue.main.async {
            self.present(controller, animated: false)
        }
    }
}

