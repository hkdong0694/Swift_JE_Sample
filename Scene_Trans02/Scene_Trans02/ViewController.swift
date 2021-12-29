//
//  ViewController.swift
//  Scene_Trans02
//
//  Created by KyungDong Han on 2021/12/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveByNavi(_ sender: Any) {
        
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        
        self.navigationController?.pushViewController(uvc, animated: true)
        
    }
    
    
    @IBAction func movePresent(_ sender: Any) {
        
        guard let uvc2 = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        
        self.present(uvc2, animated: true)
        
    }
    
    
}

