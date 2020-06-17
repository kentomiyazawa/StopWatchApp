//
//  ViewController.swift
//  StopWatchApp
//
//  Created by 宮沢建人 on 2020/06/17.
//  Copyright © 2020 miyazawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    var startTime: TimeInterval? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @objc func update() {
        // 2001/1/1 00:00:00が基準値
//        print(Date.timeIntervalSinceReferenceDate)
        if let startTime = self.startTime {
            let t: Double = Date.timeIntervalSinceReferenceDate - startTime
            print(t)
        }
    }
    @IBAction func startTimer(_ sender: Any) {
        // スタートボタンを押した時の時間
        self.startTime = Date.timeIntervalSinceReferenceDate
        Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(self.update),
            userInfo: nil,
            repeats: true)
    }
    @IBAction func stopTimer(_ sender: Any) {
    }
    @IBAction func resetTimer(_ sender: Any) {
    }
}

