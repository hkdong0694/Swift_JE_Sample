//
//  ViewController.swift
//  IBTest
//
//  Created by KyungDong Han on 2021/12/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var uiTitle01: UILabel!
    
    @IBOutlet var uiTitle02: UILabel!
    
    @IBOutlet var uiTitle03: UILabel!
    
    @IBOutlet var uiTitle04: UILabel!
    
    @IBOutlet var uiTitle05: UILabel!
    
    override func viewDidLoad() {
        // 아예 안쓸 경우에만 지울것
        // 부모 Method 실행
        super.viewDidLoad()
    }
    
    
    @IBAction func clickBtn01(_ sender: Any) {
        // Button01 Click 시 Label 01 Text 변경!!
        self.uiTitle01.text = "Click Btn 01"
    }
    
    @IBAction func clickBtn02(_ sender: Any) {
        // Button02 Click 시 Label 02 Text 변경!!
        self.uiTitle02.text = "Click Btn 02"
    }
    
    @IBAction func clickBtn03(_ sender: Any) {
        // Button03 Click 시 Label 03 Text 변경!!
        self.uiTitle03.text = "Click Btn 03"
    }
    
    @IBAction func clickBtn04(_ sender: Any) {
        // Button04 Click 시 Label 04 Text 변경!!
        self.uiTitle04.text = "Click Btn 04"

    }
    
    @IBAction func clickBtn05(_ sender: Any) {
        // Button05 Click 시 Label 05 Text 변경!!
        self.uiTitle05.text = "Click Btn 05"
    }
}

