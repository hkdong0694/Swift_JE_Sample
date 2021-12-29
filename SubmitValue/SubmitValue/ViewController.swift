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

    // 자동 갱신 여부가 바뀔 때마다 호출되는 메서드
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
    
    // 갱신주기가 바뀔 때마다 호출되는 메서드
    @IBAction func onStepper(_ sender: UIStepper) {
        
        // 만약 sender 의 타입이 Any 일 경우
        // guard let obj = sender as? UIStepper else {
        //     return
        // }
        
        let value = Int(sender.value)
        self.intervalText.text = "\(value)분 마다"
    }
    
    @IBAction func onPerformSwgue(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualSubmit", sender: self)
    }
    
    // 세그웨이를 통해 화면을 전달하기 전에 전처리 메서드를 통해 데이터 값을 저장한다..!!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination
        
        guard let uvc = dest as? ResultViewController else {
            return
        }
        
        uvc.paramEmail = self.email.text!
        uvc.paramUpdate = self.isUpdate.isOn
        uvc.paramInterval = self.interval.value
        
        
    }
    
    // 화면 전환 및 데이터 전달
    @IBAction func onSubmit(_ sender: Any) {
        
        // 넘겨줄 ViewController 인스턴스 생성
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else {
        return
        }
        
        // 값 전달
        uvc.paramEmail = self.email.text! // 이메일
        uvc.paramUpdate = self.isUpdate.isOn // 자동갱신 여부
        uvc.paramInterval = self.interval.value // 갱신 주기
        // 화면 이동
        // self.present(uvc, animated: true)
        self.navigationController?.pushViewController(uvc, animated: true)
    }
}

