//
//  ViewController.swift
//  SubmitValue
//
//  Created by KyungDong Han on 2021/12/29.
//

import UIKit

class ViewController: UIViewController {
    
    // 이메일 주소를 입력받는 텍스트 필드
    @IBOutlet var email : UITextField!
    
    // 자동갱신 여부를 설정하는 스위치
    @IBOutlet var isUpdate: UISwitch!
    
    // 갱신 주기를 설정하는 스테퍼
    @IBOutlet var interval: UIStepper!
    
    // 자동생신 여부를 표시하는 레이블
    @IBOutlet var isUpdateText: UILabel!
    
    // 갱신 주기를 표시하는 레이블

    @IBOutlet var intervalText: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSwitch(_ sender: UISwitch) {
        
        // 만약 sender 의 타입이 Any 일 경우
        // guard let obj = sender as? UISwitch else {
        //     return
        // }
        
        
        if(sender.isOn == true) {
            self.isUpdateText.text = "갱신함"
        } else {
            self.isUpdateText.text = "갱신하지 않음"
        }
    }
    
    @IBAction func onStepper(_ sender: UIStepper) {
        
        // 만약 sender 의 타입이 Any 일 경우
        // guard let obj = sender as? UIStepper else {
        //     return
        // }
        
        let value = Int(sender.value)
        self.intervalText.text = "\(value)분 마다"
    }
    
}

