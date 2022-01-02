//
//  ListViewController.swift
//  MyMovieChart_Custom
//
//  Created by KyungDong Han on 2022/01/02.
//

import UIKit
class ListViewController : UITableViewController {
    
    var dataset = [
        ("다크 나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다", "2008-09-04", 8.95),
        ("호우시절", "때를 알고 내리는 좋은 비", "2009-10-15", 7.31),
        ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2010-05-07", 9.91)
    ]
    
    lazy var list : [MovieVO] = {
        var dataList = [MovieVO]()
        for( title, desc, opendata, rating) in self.dataset {
            let mvo = MovieVO()
            mvo.title = title
            mvo.description = desc
            mvo.opendate = opendata
            mvo.rating = rating
            dataList.append(mvo)
        }
        return dataList
    }()
    
    override func viewDidLoad() {
        
    }
    
    
    // 총 갯수 return
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.list.count
    }
    
    // BindView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        
        // 데이터 연결하면 될듯!!
        let title = cell.viewWithTag(101) as? UILabel
        title?.text = row.title
        
        let desc = cell.viewWithTag(102) as? UILabel
        desc?.text = row.description
        
        let opendate = cell.viewWithTag(103) as? UILabel
        opendate?.text = row.opendate
        
        let rating = cell.viewWithTag(104) as? UILabel
        rating?.text = "\(row.rating!)"
        
        return cell
    }
    
    // Click Event
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("클릭한 셀은 \(indexPath.row) 번째 행입니다.")
    }
    
    
}
