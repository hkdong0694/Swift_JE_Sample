//
//  ListViewController.swift
//  Table_CellHeight
//
//  Created by KyungDong Han on 2022/01/02.
//

import UIKit
class ListViewController : UITableViewController {
    
    // 테이블 뷰에 연결될 데이터를 저장하는 배열
    var list = [String]()
    
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func add(_ sender: Any) {
        let alert = UIAlertController(title: "목록 입력", message: "추가될 글을 작성해주세요", preferredStyle: .alert)
        
        alert.addTextField() {
            (tf) in
            tf.placeholder = "내용을 입력해주세요"
            
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let ok = UIAlertAction(title: "OK", style: .default) {
            (_) in
            if let title = alert.textFields?[0].text {
                self.list.append(title)
                self.tableView.reloadData()
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        self.present(alert, animated: true)
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        
        // 셀의 기본 텍스트 레이블 행 수 제한을 없앤다.
        cell.textLabel?.numberOfLines = 0
        
        cell.textLabel?.text = list[indexPath.row]
        return cell
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let row = list[indexPath.row]
//
//        // 높이를 조절해준다. 기본 높이 60 + 글의 길이가 30자를 넘어갈때 마다 20만큼씩 높이를 늘려준다.
//        let height = CGFloat( 60 + (row.count / 30) * 20)
//        return height
//    }
    
    
}
