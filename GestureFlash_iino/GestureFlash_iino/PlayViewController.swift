//
//  PlayViewController.swift
//  GestureFlash_iino
//
//  Created by 飯野日向子 on 2020/06/15.
//  Copyright © 2020 ALJ飯野日向子. All rights reserved.
//

import UIKit
class PlayViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var completedGesturesLabel: UILabel!
    
    @IBOutlet weak var gestureImage: UIImageView!
    
  
    //ゲームの経過時間を計測
    var startTime = NSDate()
    //こなしたジェスチャーの数を管理
    var completedGestures = Int()
    //現在の問題で、発見すべきジェスチャーを記録
    var currentGesture = Int()
    //経過時間を画面に表示するためのタイマー
    var timer = Timer()
    var timerCount = Double()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //所要時間を計測
        var elapsedTime = startTime.timeIntervalSinceNow
        elapsedTime = -(elapsedTime)
        //ResultViewController（RVC）のインスタンスを作成し、
        //RVCクラスのメンバー変数である「time」に値を渡す
        if segue.identifier == "toResultView" {
            let rvc = segue.destination as! ResultViewController
            rvc.time = elapsedTime
        }
    }
    
    func nextProblem() {
        //もし出題規定数（ジェスチャー30個）に達している場合
        if completedGestures == 30 {
            //結果表示画面へのSegueを始動
            self.performSegue(withIdentifier: "toResultView", sender: self)
        } else {
            //配列にジェスチャーを示す画像取り込み
            let gestureIcons = [
                UIImage(named: "swipe-right"),
                UIImage(named: "swipe-left"),
                UIImage(named: "swipe-up"),
                UIImage(named: "swipe-down"),
                UIImage(named: "pinch-in"),
                UIImage(named: "pinch-out"),
                UIImage(named: "rotate-right"),
                UIImage(named: "rotate-left")
            ]
            //乱数をもとに、次のジェスチャーを選択
            currentGesture = Int(arc4random() % 8)
            NSLog("got new gesture current: %d", currentGesture)
            //画面に出てるジェスチャーの画像を差し替え、問題番号を更新
            gestureImage.image = gestureIcons[currentGesture]
            completedGesturesLabel.text = String(format: "%d", completedGestures)
        }
    }
    
    //0.1秒毎に呼ばれる経過時間表示を更新処理
    @objc func onTimer(timer: Timer) {
               timerCount = timerCount + 0.1
               timeLabel.text = String(format: "%.1f", timerCount)
           }
           
    
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        //こなしたジェスチャーの数を0にリセット
        completedGestures = 0
        //Gesture Recognizersをセット
         self.setGestureRecognizers()
        //最初の問題を表示
        self.nextProblem()
        
        //経過時間を表示するタイマーの始動
        //0.1秒毎に「-(void)onTimer」が呼ばれる
        timerCount = 0
        timer = Timer.scheduledTimer(
            timeInterval: 0.1,
            target: self,
            selector: #selector(PlayViewController.onTimer(timer:)),
            userInfo: nil,
            repeats: true
        )
        
    }
        
        //Gesture Recognizerをセット
        func setGestureRecognizers() {
            //Pinch（2本の指でつまむ）の認識
            let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(PlayViewController.pinchDetected(sender:)))
            self.view.addGestureRecognizer(pinchRecognizer)
            //Rotate（2本の指で回転）の認識
            let rotationRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(PlayViewController.rotationDetected(sender:)))
            self.view.addGestureRecognizer(rotationRecognizer)
            //右向きのSwipe（1本指でなぞる）の認識
            let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(PlayViewController.swipeRightDetected(sender:)))
            swipeRightRecognizer.direction = UISwipeGestureRecognizer.Direction.right
            self.view.addGestureRecognizer(swipeRightRecognizer)
            //左向きのSwipe（1本指でなぞる）の認識
            let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(PlayViewController.swipeLeftDetected(sender:)))
            swipeLeftRecognizer.direction = UISwipeGestureRecognizer.Direction.left
            self.view.addGestureRecognizer(swipeLeftRecognizer)
            //上向きのSwipe（1本指でなぞる）の認識
            let swipeUpRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(PlayViewController.swipeUpDetected(sender:)))
            swipeUpRecognizer.direction = UISwipeGestureRecognizer.Direction.up
            self.view.addGestureRecognizer(swipeUpRecognizer)
            //下向きのSwipe（1本指でなぞる）の認識
            let swipeDownRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(PlayViewController.swipeDownDetected(sender:)))
            swipeDownRecognizer.direction = UISwipeGestureRecognizer.Direction.down
            self.view.addGestureRecognizer(swipeDownRecognizer)
        }
       
       //右向きスワイプ検知時に呼ばれるメソッド
    @objc func swipeRightDetected(sender: UIGestureRecognizer) {
           NSLog("右向きSwipe")
           NSLog("current: %d", currentGesture)
           //正解が右向きSwipe（0番）なら
           if currentGesture == 0 {
               NSLog("NEXT")
               completedGestures += 1
               self.nextProblem()
           }
       }
       //左向きスワイプ検知時に呼ばれるメソッド
    @objc func swipeLeftDetected(sender: UIGestureRecognizer) {
           NSLog("左向きSwipe")
           NSLog("current: %d", currentGesture)
           //正解が右向きSwipe（0番）なら
           if currentGesture == 1 {
               NSLog("NEXT")
               completedGestures += 1
               self.nextProblem()
           }
       }
       //上向きスワイプ検知時に呼ばれるメソッド
    @objc func swipeUpDetected(sender: UIGestureRecognizer) {
           NSLog("上向きSwipe")
           NSLog("current: %d", currentGesture)
           //正解が右向きSwipe（0番）なら
           if currentGesture == 2 {
               NSLog("NEXT")
               completedGestures += 1
               self.nextProblem()
           }
       }
       //下向きスワイプ検知時に呼ばれるメソッド
    @objc func swipeDownDetected(sender: UIGestureRecognizer) {
           NSLog("下向きSwipe")
           NSLog("current: %d", currentGesture)
           //正解が右向きSwipe（0番）なら
           if currentGesture == 3 {
               NSLog("NEXT")
               completedGestures += 1
               self.nextProblem()
           }
       }

//回転動作検知時の呼ばれるメソッド
    @objc func rotationDetected(sender: UIRotationGestureRecognizer) {
    //Rotate開始時から見た回転の度合い（ラジアン）
    let radians = sender.rotation
    //「ラジアン」を「度」に変換
    let degrees = radians * CGFloat(180/M_PI)
    if degrees > 90 {
        NSLog("時計回りにRotate degrees: %f", degrees)
        NSLog("current: %d", currentGesture)
        //正解が時計回りRotate（6番）なら
        if currentGesture == 6 {
            NSLog("NEXT")
            completedGestures += 1
            self.nextProblem()
        }
    } else if degrees < -90 {
        NSLog("反時計回りにRotate degrees: %f", degrees)
        NSLog("current: %d", currentGesture)
        //正解が時計回りRotate（7番）なら
        if currentGesture == 7 {
            NSLog("NEXT")
            completedGestures += 1
            self.nextProblem()
        }
    }
}

//ピンチ動作検知時に呼ばれるメソッド
    @objc func pinchDetected(sender: UIPinchGestureRecognizer) {
    //ピンチ開始の2本の指の距離を1とした時
    //現在の2本の指の相対距離
    let scale = sender.scale
    if scale > 2.4 {
        NSLog("外向きにPinch scale: %f", scale)
        NSLog("current: %d", currentGesture)
        //正解が外向きPinch（5番）なら
        if currentGesture == 5 {
            NSLog("NEXT")
            completedGestures += 1
            self.nextProblem()
        }
    } else if scale < 0.4 {
        NSLog("内向きにPinch scale: %f", scale)
        NSLog("current: %d", currentGesture)
        //正解が内向きPinch（4番）なら
        if currentGesture == 4 {
            NSLog("NEXT")
            completedGestures += 1
            self.nextProblem()
        }
    }
}

}

