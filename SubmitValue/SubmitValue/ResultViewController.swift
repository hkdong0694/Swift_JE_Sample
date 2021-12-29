//
//  ResultViewController.swift
//  SubmitValue
//
//  Created by KyungDong Han on 2021/12/29.
//

import UIKit
class ResultViewController : UIViewController {
    
    // 화면에 표시할 레이블 정의
    @IBOutlet var resultEmail: UILabel! // 이메일
    @IBOutlet var resultUpdate: UILabel! // 자동갱신
    @IBOutlet var resultInterval: UILabel! // 갱신주기
    
    // email 값 받아올 변수
    var paramEmail : String = ""
    // 자동갱신 여부 받아올 변수
    var paramUpdate : Bool = false
    // 갱신주기 값 받아올 변수
    var paramInterval: Double = 0

    // 화면이 갱신될때 불러오는 메서드
    override func viewDidLoad() {
        self.resultEmail.text = paramEmail
        self.resultUpdate.text = (self.paramUpdate == true
            ? "자동갱신" : "자동갱신안함")
        self.resultInterval.text = "\(Int(self.paramInterval))분 마다 갱신"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NSLog("okok22")
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
