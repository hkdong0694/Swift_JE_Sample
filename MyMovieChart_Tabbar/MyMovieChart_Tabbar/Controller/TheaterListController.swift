//
//  TheaterListController.swift
//  MyMovieChart_Tabbar
//
//  Created by KyungDong Han on 2022/01/11.
//

import UIKit

class TheaterListController : UITableViewController {
    
    // 통신해서 가져올 List
    var list = [NSDictionary]()
    
    // 읽어올 페이지
    var startPoint = 0
    
    override func viewDidLoad() {
        self.callOpenAPI()
    }
    
    // OpenAPI 호출
    fileprivate func callOpenAPI() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tCell") as! TheaterCell
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
