//
//  ViewController.swift
//  PushNotificationTest
//
//  Created by Chen Wu on 10/13/17.
//  Copyright © 2017 OpenTable. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushAction(_ sender: Any) {
        self.showCustomContentNotification()
    }
    
    func showCustomContentNotification() {
        
        let content = NotificationContent(title: "hey there i just met you", subTitle: "and this is crazy", body: "push notification body")
        
        content.categoryIdentifier = "categoryId"
        
        let request = UNNotificationRequest(identifier: "Anything", content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { error in
            UNUserNotificationCenter.current().delegate = self
            if (error != nil){
                //handle here
            }
        }
    }
}

extension ViewController: UNUserNotificationCenterDelegate {
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Swift.Void) {
        completionHandler( [.alert, .badge, .sound])
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Swift.Void) {
        print("Tapped in notification", response)
        completionHandler()
    }
    
}

final class NotificationContent: UNMutableNotificationContent {
    init(title: String, subTitle: String, body: String) {
        super.init()
        self.title = title
        self.subtitle = subTitle
        self.body = body
        self.sound = UNNotificationSound.default()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

