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
        
        let ud = UserDefaults.standard
        
        // 옵셔널 해제 ( guard 를 안쓰는 것은 해당 메서드가 종료되어선 안되기때문에 if 를 써서
        // 옵셔널을 해제 시켜줘야 한다. )
        if let email = ud.string(forKey: "email") {
            resultEmail2.text = email
        }
        
        let yodate = ud.bool(forKey: "isUpdate")
        resultUpdate2.text = (yodate == true ? "자동갱신" : "자동갱신안함")
        
        
        let interval = ud.double(forKey: "interval")
        resultInterval2.text = "\(Int(interval))분마다"
        
        
    }


}

