//
//  ViewController.swift
//  Counter
//
//  Created by 飯野日向子 on 2020/06/05.
//  Copyright © 2020 ALJ飯野日向子. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var countLabel: UILabel!
      
    var count = Int()
    
    var countLabelText = String()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // 画面起動時にcountを0に初期化
                count = 0
        
        }
        
    @IBAction func plusPushed(_ sender: Any) {
    
            // countに1を加算
            count = count + 1
            // ラベル用に文字列を用意
            countLabelText = "\(count)"
            // countLabelの値を更新
            countLabel.text = countLabelText
        
            // countの大小に応じて、ラベルの色を変更
            if count >= 0 && count < 10 {
                countLabel.textColor = UIColor.black
            } else if count >= 10 && count < 20 {
                countLabel.textColor = UIColor.green
            } else if count >= 20 && count < 30 {
                countLabel.textColor = UIColor.yellow
            } else {
                countLabel.textColor = UIColor.red
            }
    
    }
    
    
    @IBAction func minusPushed(_ sender: Any) {
        // もし、countが整数であれば...
            if count > 0 {
                // countから1を減算
                count = count - 1
            }
            // ラベル用に文字列を用意
            countLabelText = "\(count)"
            // countLabelの値を更新
            countLabel.text = countLabelText
            
            // countの大小に応じて、ラベルの色を変更
            if count >= 0 && count < 10 {
                countLabel.textColor = UIColor.black
            } else if count >= 10 && count < 20 {
                countLabel.textColor = UIColor.green
            } else if count >= 20 && count < 30 {
                countLabel.textColor = UIColor.yellow
            } else {
                countLabel.textColor = UIColor.red
            }
        
        }
        


    
    
    @IBAction func resetPushed(_ sender: Any) {
        // countを0に初期化
                count = 0
                // ラベル用に文字列を用意し、ラベルを更新
                countLabelText = "\(count)"
                countLabel.text = countLabelText
                
            }
            override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
                // Dispose of any resources that can be recreated.
            }


        }


    
    
    
