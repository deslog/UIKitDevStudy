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

    // MARK: Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        attribute()

        // 앱이 런치될때 push를 주도록 구현할 예정 -> viewDidLoad에다가 코드 작성
        // step.1 알람 권한 알럿창 띄우기
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if error != nil {
                // handle the error here
            }
            // Enable or disable features based on the authorization.
        }

        // step.2 push 알림에 띄울 content 정의하기
        let content = UNMutableNotificationContent()
        content.title = "부모님께 전화할 시간이야!"
        content.body = "얼른 전화하시지? 전화안한지 3일이나 지났잖아 으휴"

        // step.3 알림 trigger 만들기
        let date = Date().addingTimeInterval(10) // second
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        // step.4 create request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)

        // step.5 register request 언제 알림을줄지 등록하는 부분
        center.add(request) { (error) in
            // check the error parameter and handle any errors.
        }
    }

    // MARK: Method

    func attribute() {
        layout()
    }

    func layout() {
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
