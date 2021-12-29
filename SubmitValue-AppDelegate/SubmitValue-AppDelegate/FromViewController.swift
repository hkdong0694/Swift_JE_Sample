//
//  FromViewController.swift
//  SubmitValue-AppDelegate
//
//  Created by KyungDong Han on 2021/12/29.
//

import UIKit
class FromViewController : UIViewController {
    
    
    @IBOutlet var email2: UITextField!
    
    @IBOutlet var isUpdate2: UISwitch!
    
    @IBOutlet var interval2: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSubmit2(_ sender: Any) {
        // presentingViewController 속성을 통해 이전 화면 객체를 읽어온 다음, viewController 타입으로 캐스팅한다.
        // let preVC = self.presentingViewController
        //
        // guard let vc = preVC as? ViewController else {
        //     return
        // }
        //
        // vc.paramEmail = self.email2.text
        // vc.paramUpdate = self.isUpdate2.isOn
        // vc.paramInterval = self.interval2.value
        //
        // self.dismiss(animated: true)
        
        guard let ad = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        ad.paramEmail = self.email2.text
        ad.paramUpdate = self.isUpdate2.isOn
        ad.paramInterval = self.interval2.value
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)

    }
    
}

