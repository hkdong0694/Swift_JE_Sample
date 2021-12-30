//
//  ViewController.swift
//  Msg-Notification
//
//  Created by KyungDong Han on 2021/12/30.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet var msg: UITextField!
    
    @IBOutlet var datepicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func save(_ sender: Any) {
        if #available(iOS 10.0, *) {
            // UserNotification 프레임워크를 사용한 로컬 알림
            UNUserNotificationCenter.current().getNotificationSettings(completionHandler: {
                (settings) in
                if settings.authorizationStatus == .authorized {
                    DispatchQueue.main.async {
                        let nContent = UNMutableNotificationContent()
                        nContent.badge = 1
                        
                        nContent.title = "미리 알림"
                        nContent.body = (self.msg.text)!
                        nContent.sound = UNNotificationSound.default
                        let time = self.datepicker.date.timeIntervalSinceNow
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                        let request = UNNotificationRequest(identifier: "alarm", content: nContent, trigger: trigger)
                        UNUserNotificationCenter.current().add(request, withCompletionHandler: {
                        (_) in
                            DispatchQueue.main.async {
                                // 발송 완료 안내 메시지 창
                                let date = self.datepicker.date.addingTimeInterval(9*60*60)
                                let message = "알림이 등록되었습니다. 등록된 알림은 \(date)에 발송됩니다."
                                let alert = UIAlertController(title: "알림등록", message: message, preferredStyle: .alert)
                                let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                                alert.addAction(ok)
                                self.present(alert, animated: true, completion: nil)
                            }
                        })
                    }
                } else {
                    
                }
            })
        } else {
            // LocalNotification 객체를 사용한 로컬 알림
        }
    }
    
}

