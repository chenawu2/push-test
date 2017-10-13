//
//  NotificationViewController.swift
//  NotificationContentExtension
//
//  Created by Chen Wu on 10/13/17.
//  Copyright © 2017 OpenTable. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    @IBOutlet var customView: UIView!
    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
//        self.label?.text = notification.request.content.body
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        self.becomeFirstResponder()
        completion(.doNotDismiss)
    }
    
    override var inputView: UIView? {
        return self.customView
    }

}
