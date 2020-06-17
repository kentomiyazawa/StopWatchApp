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
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var startTime: TimeInterval? = nil
    var timer = Timer()
    var elapsedTime: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButtonEnabled(start: true, stop: false, reset: false)
    }
    
    func setButtonEnabled(start: Bool, stop: Bool, reset: Bool) {
        self.startButton.isEnabled = start
        self.stopButton.isEnabled = stop
        self.resetButton.isEnabled = reset
    }

    @objc func update() {
        // 2001/1/1 00:00:00が基準値
//        print(Date.timeIntervalSinceReferenceDate)
        if let startTime = self.startTime {
            let t: Double = Date.timeIntervalSinceReferenceDate - startTime + self.elapsedTime
            let min = Int(t / 60)
            let sec = Int(t) % 60
            let msec = Int((t - Double(min * 60) - Double(sec)) * 100.0)
            self.timerLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
        }
    }
    @IBAction func startTimer(_ sender: Any) {
               setButtonEnabled(start: false, stop: true, reset: false)
        // スタートボタンを押した時の時間
        self.startTime = Date.timeIntervalSinceReferenceDate
        self.timer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(self.update),
            userInfo: nil,
            repeats: true)
    }
    @IBAction func stopTimer(_ sender: Any) {
               setButtonEnabled(start: true, stop: false, reset: true)
       if let startTime = self.startTime {
          self.elapsedTime += Date.timeIntervalSinceReferenceDate - startTime
        }
//        invalidate()メソッドはタイマーを止める
        self.timer.invalidate()
    }
    @IBAction func resetTimer(_ sender: Any) {
               setButtonEnabled(start: true, stop: false, reset: false)
        self.startTime = nil
        self.timerLabel.text = "00:00:00"
        self.elapsedTime = 0.0
}

}
