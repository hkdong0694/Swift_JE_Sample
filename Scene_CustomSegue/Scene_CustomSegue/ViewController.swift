//
//  ViewController.swift
//  Scene_CustomSegue
//
//  Created by KyungDong Han on 2021/12/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 화면을 전환하기 전에 호출!
        if(segue.identifier == "action_segue") {
            NSLog("액션 세그웨이 입니다.")
        } else if (segue.identifier == "custom_segue") {
            NSLog("커스텀 세그웨이 입니다.")
        } else {
            NSLog("알 수 없는 세그웨이입니다.")
        }
    }

}

