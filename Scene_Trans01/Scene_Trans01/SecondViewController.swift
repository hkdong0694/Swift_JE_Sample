//
//  SecondViewController.swift
//  Scene_Trans01
//
//  Created by KyungDong Han on 2021/12/28.
//

import UIKit
class SecondViewController: UIViewController {
    
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
