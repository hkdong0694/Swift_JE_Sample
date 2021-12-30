//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by KyungDong Han on 2021/12/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tf: UITextField!
    
    override func viewDidLoad() {
        self.tf.placeholder = "값을 입력하세요" // 안내 메세지
        self.tf.keyboardType = UIKeyboardType.alphabet // 키보드 타입 영문자 패드로
        self.tf.keyboardAppearance = UIKeyboardAppearance.dark // 키보드 스타일 어둡게
        self.tf.returnKeyType = UIReturnKeyType.join // 리턴키 타입은 "Join"
        self.tf.enablesReturnKeyAutomatically = true // 리턴키 자동 활성화 "On"
        
        // 테두리 스타일 - 직선
        self.tf.borderStyle = UITextField.BorderStyle.line
        // 배경 색상
        self.tf.backgroundColor = UIColor(white: 0.87, alpha: 1.0)
        // 수직 방향으로 텍스트가 가운데 정렬되도록
        self.tf.contentVerticalAlignment = .center
        // 수평 방향으로 텍스트가 가운데 정렬되도록
        self.tf.contentHorizontalAlignment = .center
        // 테두리 색상을 회색으로
        self.tf.layer.borderColor = UIColor.darkGray.cgColor
        // 테두리 두께 설정 ( 단위 : pt )
        self.tf.layer.borderWidth = 2.0
        
        // 최초 응답자 설정
        // Android -:> requestFocus 랑 비슷함
        // 최초 응답자로 설정하면 화면이 나타날대 자동으로 키패드가 등장한다.
        self.tf.becomeFirstResponder()
        
    }

    @IBAction func confirm(_ sender: Any) {
        // 텍스트 필드를 최초 응답자 객체에서 해제 한다.
        // 키패드가 내려간다.
        self.tf.resignFirstResponder()
    }
    
    @IBAction func input(_ sender: Any) {
        self.tf.becomeFirstResponder()
    }
}

