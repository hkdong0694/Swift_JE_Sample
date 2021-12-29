//
//  ViewController.swift
//  SubmitValue-AppDelegate
//
//  Created by KyungDong Han on 2021/12/29.
//
import UIKit

class ViewController: UIViewController {

    // 값을 화면에 표시하기 위한 아울렛 변수들
    @IBOutlet var resultEmail2: UILabel!
    
    @IBOutlet var resultUpdate2: UILabel!
    
    @IBOutlet var resultInterval2: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        NSLog("viewDidAppear")
    }
    
    
    @IBAction func onRegist2(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    // 뷰 컨트롤러의 뷰가 화면에 표시될 때마다 실행되는 메서드 ( onResume() )
    override func viewWillAppear(_ animated: Bool) {
        
        guard let ad = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        if let email = ad.paramEmail {
            resultEmail2.text = email
        }
        if let update = ad.paramUpdate {
            resultUpdate2.text = update == true ? "자동갱신" : "자동갱신안함"
        }
        if let interval = ad.paramInterval {
            resultInterval2.text = "\(Int(interval))분마다"
        }
        
    }


}

