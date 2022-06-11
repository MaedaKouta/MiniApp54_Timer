//
//  ViewController.swift
//  MiniApp54_Timer
//
//  Created by 前田航汰 on 2022/06/11.
//

import UIKit
import UICircularProgressRing

class ViewController: UIViewController {

    @IBOutlet weak var timerRing: UICircularTimerRing!
    @IBOutlet weak var button: UIButton!
    enum Flug {
        case start, stop, restart
    }
    var flag = Flug.start

    override func viewDidLoad() {
        super.viewDidLoad()
        setting()
    }

    @IBAction func didTapButton(_ sender: Any) {
        switch flag {
        case Flug.start:
            self.flag = Flug.stop
            self.button.setTitle("ストップ", for: .normal)
            timerRing.startTimer(to: 360) { state in
                switch state {
                case .finished:
                    self.flag = Flug.start
                    self.button.setTitle("開始", for: .normal)
                    //リセット
                    self.timerRing.resetTimer()
                case .continued:
                    self.flag = Flug.stop
                    self.button.setTitle("ストップ", for: .normal)
                case .paused:
                    self.flag = Flug.restart
                    self.button.setTitle("再開", for: .normal)
                }
            }
        case Flug.stop:
            //ストップ
            timerRing.pauseTimer()
        case Flug.restart:
            //再開
            timerRing.continueTimer()
        }
    }

    func setting()  {
        timerRing.startAngle = 270
        timerRing.isReverse = true
        timerRing.shouldShowValueText = true
        timerRing.outerRingColor = .clear
        timerRing.innerRingColor = .blue
    }

}

