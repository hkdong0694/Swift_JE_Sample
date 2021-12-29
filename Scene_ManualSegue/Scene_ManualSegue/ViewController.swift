//
//  ViewController.swift
//  Scene_ManualSegue
//
//  Created by KyungDong Han on 2021/12/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func wind(_ sender: Any) {
        // 세그웨이를 실행한다.
        self.performSegue(withIdentifier: "ManualWind", sender: self)
    }
    
}

