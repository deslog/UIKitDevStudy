//
//  UserNotificationsViewController.swift
//  UIKitDevStudy
//
//  Created by LeeJiSoo on 2022/07/19.
//

import UIKit
import UserNotifications

class UserNotificationsViewController: UIViewController {

    // MARK: View

    private let label: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "push notification demo"
        $0.textColor = .red
        return $0
    }(UILabel())

    // MARK: Property

    private let notificationCenter = UNUserNotificationCenter.current()

    // MARK: Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        attribute()
        layout()
        generateUserNotification()
    }

    // MARK: Method

    private func generateUserNotification() {
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if let error = error {
                print(error)
            } else {
                if granted {
                    let content = UNMutableNotificationContent()
                    content.title = "아직 전화하지 않았어요"
                    content.subtitle = "아들아 보고싶다!!!"
                    content.body = "전화한지 3일이 지났어요 ㅠㅠ 🥹"
                    content.badge = 1
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                    let request = UNNotificationRequest(identifier: "Sample Notification", content: content, trigger: trigger)
                    self.notificationCenter.add(request, withCompletionHandler: nil)
                } else {
                    print("Not Granted")
                }
            }
        }
    }

    private func attribute() {
        view.backgroundColor = .systemGroupedBackground
    }

    private func layout() {
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
