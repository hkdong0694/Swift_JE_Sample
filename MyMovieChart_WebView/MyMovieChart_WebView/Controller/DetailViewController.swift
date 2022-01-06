//
//  DetailViewController.swift
//  MyMovieChart_WebView
//
//  Created by KyungDong Han on 2022/01/06.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet var wv: WKWebView!
    
    var mvo: MovieVO! // 목록 화면에서 전달하는 영화 정보를 받을 변수
    
    
    override func viewDidLoad() {
        
        let navibar = self.navigationItem
        navibar.title = self.mvo?.title
        
        if let url = self.mvo.detail {
            if let urlObj = URL(string: url) {
                let req = URLRequest(url: urlObj)
                // loadRequest 메소드를 호출하면서 req 를 인다값으로 전달한다.
                self.wv.load(req)
            } else {
                let alert = UIAlertController(title: "오류", message: "잘못된 URL 입니다.", preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "확인", style: .cancel) {
                    (_) in
                    _ = self.navigationController?.popViewController(animated: true)
                }
                
                alert.addAction(cancelAction)
                self.present(alert, animated: false, completion: nil)
            }
        } else {
            // URL 값이 전달되지 않았을 경우에 대한 예외처리
            // 경고창 형식으로 오류 메시지를 표시해준다.
            
            let alert = UIAlertController(title: "오류", message: "필수 파라미터가 누락되었습니다.", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "확인", style: .cancel) {
                (_) in
                _ = self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(cancelAction)
            self.present(alert, animated: false, completion: nil)
        }
    }
}
