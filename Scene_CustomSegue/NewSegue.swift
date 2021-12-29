//
//  NewSegue.swift
//  Scene_CustomSegue
//
//  Created by KyungDong Han on 2021/12/29.
//

import UIKit
class NewSegue : UIStoryboardSegue {
    override func perform() {
        // 세그웨이의 출발지 뷰 컨트롤러
        let srcUVC = self.source
        
        // 세그웨이의 목적지 뷰 컨트롤러
        let destUVC = self.destination
        
        // fromView 에서 toView 로 뷰를 전환한다.
        UIView.transition(from: srcUVC.view, to: destUVC.view, duration: 2, options: .transitionCurlDown)
    }
}
