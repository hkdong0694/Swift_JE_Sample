//
//  DetailViewController.swift
//  MyMovieCahrt_AutoLayout
//
//  Created by KyungDong Han on 2022/01/12.
//

import UIKit
import WebKit

class DetailViewController : UIViewController {
    
    
    @IBOutlet var wv: WKWebView!
    
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    var mvo: MovieVO! // 목록 화면에서 전달하는 영화 정보를 받을 변수
    
    override func viewDidLoad() {
        
        self.wv.navigationDelegate = self
        let naviBar = self.navigationItem
        naviBar.title = self.mvo?.title
        
        if let url = self.mvo?.detail {
            if let urlObj = URL(string: url) {
                let req = URLRequest(url: urlObj)
                // loadRequest 메소드를 호출하면서 req 를 인자값으로 전달
                self.wv.load(req)
            } else {
                alert("잘못된 URL 입니다.") {
                    _ = self.navigationController?.popViewController(animated: false)
                }
            }
        } else {
            alert("필수 파라미터 오류") {
                _ = self.navigationController?.popViewController(animated: false)
            }
        }
        
    }
}

// MARK: - WKNavigationDelegate 프로토콜 구현
extension DetailViewController : WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        // 인디케이터 뷰의 애니메이션을 실행
        self.spinner.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // 인디케이터 뷰의 애니메이션을 중단
        self.spinner.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating()
        self.alert("상세 페이지를 불러오지 못했습니다.") {
            _ = self.navigationController?.popViewController(animated: false)
        }
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating()
        self.alert("상세 페이지를 불러오지 못했습니다.") {
            _ = self.navigationController?.popViewController(animated: false)
        }
    }
    
    
}


// MARK:- 심플한 경고창 함수 정의용 인스텐션
extension UIViewController {
    func alert(_ message: String, onClick: (() -> Void)? = nil) {
        let controller = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .cancel){
            (_) in onClick?()
        })
        
        DispatchQueue.main.async {
            self.present(controller, animated: false)
        }
        
    }
}


