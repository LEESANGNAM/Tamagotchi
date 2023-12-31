//
//  AppDelegate.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/04.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UNUserNotificationCenter.current().delegate = self
        
        // 알림 권한 설정
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { success, error in
            if success{
                self.dailyNineTimeNotification()
                print("성공한건가")
            }else{
                print(error)
            }
        }
        return true
    }

    func dailyNineTimeNotification(){
        // 포그라운드에서 알림이 안뜨는게 디폴트
        // 알림보내!
        //1. 컨텐츠 2. 언제
        
        //1. 컨텐츠 채우기
        let content = UNMutableNotificationContent()
        content.title = "다마고치에게 물을 \(Int.random(in: 1...49))모금주세요"
        content.body = "목말라요. 물줘요"
        content.badge = 1
        
        var component = DateComponents() //구조체라 var
        component.minute = 0 // 5분
        component.hour = 9
        //생일 적어놓고 생일이라고 보내기, 새해 날짜 정해놓고 보내기, 크리스마스 날짜 정해놓고 보내기 등등
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: true)
        
        //2. 언제
        let request = UNNotificationRequest(identifier: "dailyNineTimeNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            print(error)
        }
    }
    
    
    // MARK: UISceneSession Lifecycle

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


}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // 특정화면, 특정조건에서만 포그라운드 알림 받기,
        // 특정 화면에서는 알림 안받기
        completionHandler([.sound,.badge,.banner,.list])
    }
}

