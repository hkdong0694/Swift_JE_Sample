//
//  ViewController.swift
//  Msg-ControllerAuth
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
    
    @IBAction func onAuth(_ sender: Any) {
        
        let alert = UIAlertController(title: nil, message: "로그인", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            // 확인 눌렀을 때 체크 하는 로직 구현
            
            let loginId = alert.textFields?[0].text
            let password = alert.textFields?[1].text
            
            if(loginId == "한경동" && password == "1234") {
                self.result.text = "로그인 확인!"
            } else {
                self.result.text = "로그인 실패!"
            }
            
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        alert.addTextField(configurationHandler: {
            (tf) in
            tf.placeholder = "아이디"
            tf.isSecureTextEntry = false
        })
        alert.addTextField(configurationHandler: {
            (tf) in
            tf.placeholder = "비밀번호"
            tf.isSecureTextEntry = true
        })
        
        self.present(alert, animated: true, completion: nil)
        
    }
    


}

