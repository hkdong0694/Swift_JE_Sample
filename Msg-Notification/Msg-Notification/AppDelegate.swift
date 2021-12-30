//
//  AppDelegate.swift
//  Msg-Notification
//
//  Created by KyungDong Han on 2021/12/30.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // iOS 10 이상
        if #available(iOS 10.0, *) {
            // 경고창, 배지, 사운드를 사용하는 알림 환경 정보를 생성하고, 사용자 동의 여부 창을 실행
            let notiCenter = UNUserNotificationCenter.current()
            notiCenter.requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {
                (didAllow, e) in
                
            })
            notiCenter.delegate = self
        } else {
            // 경고창, 배지, 사운드를 사용하는 알림 환경 정보를 생성하고, 이를 애플리케이션에 저장
            let setting = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(setting)
        }
        
        return true
    }
    
    // 앱이 활성화를 잃었을 때 실행되는 메서드
    // 앱을 사용하는 도중 전화가 오거나 SMS 가 도착하는 경우 또는 사용자가 홈 버튼을 눌러 앱을 백그라운드로 내렸을 때!!
    // iOS 14.0 이상부터 라이플 사이클 변경으로 인한 SceneDelegate 에 정의 해야 한다. ( 작동 안함 )
    func applicationWillResignActive(_ application: UIApplication) {
        if #available(iOS 10.0, *) {
            
        } else {
            let setting = application.currentUserNotificationSettings
            
            guard setting?.types != .none else {
                print("Can't Schedule")
                return
            }
            
            let noti = UILocalNotification()
            noti.fireDate = Date(timeIntervalSinceNow: 10) // 10초 후 발송
            noti.timeZone = TimeZone.autoupdatingCurrent // 현재 위치에 따라 타임존 설정
            noti.alertBody = "얼른 다시 접속하세요." // 표시될 메세지
            noti.alertAction = "학습하기"   // 잠금 상태일때 표시될 액션
            noti.applicationIconBadgeNumber = 1 // 앱 아이콘 모서리에 표시될 배지
            noti.soundName = UILocalNotificationDefaultSoundName    // 로컬 알람 도착시 사운드
            noti.userInfo = ["name" : "한경동"]    // 알람 실행시 함게 전달하고 싶은 값, 화면에는 표시되지 않음
            
            // 생성된 알람 객체를 스케줄러에 등록
            application.scheduleLocalNotification(noti)
            
        }
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // 앱 실행 도중에 알림 메시지가 도착한 경우
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if notification.request.identifier == "wakeup" {
            let userInfo = notification.request.content.userInfo
            print(userInfo["name"]!)
        }
        // 알림 배너 띄워주기
        completionHandler([.alert, .badge, .sound])
    }
    
    // 사용자가 알림 메시지를 클릭했을 경우
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.identifier == "wakeup" {
            let userInfo = response.notification.request.content.userInfo
            print("\(userInfo["name"]!) 알림 메시지 클릭!!")
        }
        completionHandler()
    }


}

