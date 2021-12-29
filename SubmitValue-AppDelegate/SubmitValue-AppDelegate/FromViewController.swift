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
        
        let ud = UserDefaults.standard
        
        ud.set(self.email2.text, forKey: "email")
        ud.set(self.isUpdate2.isOn, forKey: "isUpdate")
        ud.set(self.interval2.value, forKey: "interval")
        
//        guard let ad = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
//        ad.paramEmail = self.email2.text
//        ad.paramUpdate = self.isUpdate2.isOn
//        ad.paramInterval = self.interval2.value
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)

    }
    
}

