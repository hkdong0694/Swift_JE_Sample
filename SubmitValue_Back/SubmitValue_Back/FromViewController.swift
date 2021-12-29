//
//  FromViewController.swift
//  SubmitValue_Back
//
//  Created by KyungDong Han on 2021/12/29.
//

import UIKit
class FromViewController : UIViewController {
    
    
    @IBOutlet var email: UITextField!
    
    @IBOutlet var isUpdate: UISwitch!
    
    @IBOutlet var interval: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 뷰 컨트롤러의 뷰가 화면에 표시될 때마다 실행되는 메서드 ( onResume() )
    override func viewWillAppear(_ animated: Bool) {
        NSLog("호123출")
    }
    
    // Submit 버튼 클릭 시 호출되는 메서드
    @IBAction func onSubmit(_ sender: Any) {
        // presentingViewController 속성을 통해 이전 화면 객체를 읽어온 다음, viewController 타입으로 캐스팅한다.
        let preVC = self.presentingViewController
        
        guard let vc = preVC as? ViewController else {
            return
        }
        
        vc.paramEmail = self.email.text
        vc.paramUpdate = self.isUpdate.isOn
        vc.paramInterval = self.interval.value
        
        self.dismiss(animated: true)
        
        
        
    }
    
}
