//
//  ViewController.swift
//  Msg-AlertController
//
//  Created by KyungDong Han on 2021/12/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let alert = UIAlertController(title: "선택",message: "항목을 선택해주세요", preferredStyle: .alert)
        
        // style -> .cancel 한번만 실행
        // 중복으로 addAction 하면 오류 난다.
        // addAction 을 맨처음에 해도 화면에는 취소 버튼이
        // 맨 마지막에 보여진다.
        let cancel = UIAlertAction(title: "취소", style: .cancel) { (_) in
            self.result.text = "취소 버튼을 클릭했습니다"
        }
        
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            self.result.text = "확인 버튼을 눌렀습니다."
        }
        
        let exec = UIAlertAction(title: "실행", style: .destructive) { (_) in
            
            self.result.text = "실행 버튼을 클릭했습니다."
        }
        
        
        let stop = UIAlertAction(title: "중지", style: .default) { (_) in
            self.result.text = "중지 버튼을 클릭했습니다."
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
        
        self.present(alert, animated: true)
    }
    
    @IBAction func alert(_ sender: Any) {
        
        let alert = UIAlertController(title: "선택",message: "항목을 선택해주세요", preferredStyle: .alert)
        
        // style -> .cancel 한번만 실행
        // 중복으로 addAction 하면 오류 난다.
        // addAction 을 맨처음에 해도 화면에는 취소 버튼이
        // 맨 마지막에 보여진다.
        let cancel = UIAlertAction(title: "취소", style: .cancel) { (_) in
            self.result.text = "취소 버튼을 클릭했습니다"
        }
        
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            self.result.text = "확인 버튼을 눌렀습니다."
        }
        
        let exec = UIAlertAction(title: "실행", style: .destructive) { (_) in
            
            self.result.text = "실행 버튼을 클릭했습니다."
        }
        
        let stop = UIAlertAction(title: "중지", style: .default) { (_) in
            self.result.text = "중지 버튼을 클릭했습니다."
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
        
        self.present(alert, animated: true)
    }
    
    @IBAction func login(_ sender: Any) {
        
        let alert = UIAlertController(title: "iTunes Store 로그인", message: "사용자의 Apple ID sqlpro@naver.com 의 비밀번호를 입력하시오.", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        let ok = UIAlertAction(title: "확인", style: .default) {
            (_) in
            // 확인 버튼을 눌렀을 때 로직 처리
            if let tf = alert.textFields?[0] {
                print("입렫된 값은 \(tf.text!)")
            } else {
                print("입려된 값이 업습니다.")
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        alert.addTextField(configurationHandler: {
            (tf) in
            tf.placeholder = "암호"
            tf.isSecureTextEntry = true
        })
        
        self.present(alert, animated: true)
        
    }
    
    
    
}

