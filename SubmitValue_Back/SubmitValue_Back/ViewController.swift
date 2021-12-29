//
//  ViewController.swift
//  SubmitValue_Back
//
//  Created by KyungDong Han on 2021/12/29.
//

import UIKit

class ViewController: UIViewController {

    // 값을 화면에 표시하기 위한 아울렛 변수들
    @IBOutlet var resultEmail: UILabel!
    
    @IBOutlet var resultUpdate: UILabel!
    
    @IBOutlet var resultInterval: UILabel!
    
    // 값을 직접 전달받을 프로퍼티들
    var paramEmail: String? // 이메일 값을 전달받을 속성
    var paramUpdate: Bool? // 자동 갱신 여부를 전달받을 속성
    var paramInterval: Double? // 갱신주기 값을 전달받을 속성
    
    override func viewDidAppear(_ animated: Bool) {
        NSLog("viewDidAppear")
    }
    
    @IBAction func onRegist(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    // 뷰 컨트롤러의 뷰가 화면에 표시될 때마다 실행되는 메서드 ( onResume() )
    override func viewWillAppear(_ animated: Bool) {
        NSLog("호출")
        if let email = paramEmail {
            resultEmail.text = email
        }
        if let update = paramUpdate {
            resultUpdate.text = update == true ? "자동갱신" : "자동갱신안함"
        }
        if let interval = paramInterval {
            resultInterval.text = "\(Int(interval))분마다"
        }
        
    }


}

