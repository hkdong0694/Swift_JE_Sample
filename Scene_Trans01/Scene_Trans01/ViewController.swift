//
//  ViewController.swift
//  Scene_Trans01
//
//  Created by KyungDong Han on 2021/12/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveNext(_ sender: Any) {
        
        // 이동할 뷰 컨트롤러 객체를 StoryboardID
        // 정보를 이용하여 참조
        // let uvc = self.storyboard!.instantiateViewController(identifier: "SecondVC")
    
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let uvc = storyboard.instantiateViewController(withIdentifier: "SecondVC")
        

        // 화면 전환할 때의 애니메이션 탕
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        // 인자값으로 뷰 컨트롤러 인스턴스를 넣고 프레젠트 메소드 호출
        self.present(uvc, animated: true)
        
    }
    
}

