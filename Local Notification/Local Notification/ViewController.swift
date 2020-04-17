//
//  ViewController.swift
//  Local Notification
//
//  Created by Srans022019 on 17/04/20.
//  Copyright © 2020 Srans02. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTapLocalNotification(_ sender: UIButton) {
        
        //Step:1 Asking for permissions
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        
        //Step:2 Create notification Content
        let content = UNMutableNotificationContent()
        content.title = "Remminder"
        content.body = "You have to wok on the weekend"
        
        //Step:3 create a trigger notification
        let date = Date().addingTimeInterval(5)
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //Step:4 Creat a notification request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // Register the request
        center.add(request) { (error) in
            //check the error parameter and check errors
        }
        
    }
    
}

