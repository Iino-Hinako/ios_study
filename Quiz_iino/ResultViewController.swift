//
//  ResultViewController.swift
//  Quiz
//
//  Created by 飯野日向子 on 2020/06/11.
//  Copyright © 2020 ALJ飯野日向子. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var percentageLabel: UILabel!
   
    @IBOutlet weak var levelImage: UIImageView!
    
    @IBOutlet weak var levelLavel: UILabel!
    
    //クイズ画面から受け渡される値
       var correctPercentage = Int()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // ▼▼ 追加 ▼▼
            //正答率に応じて「一般常識レベル」の位と画像を設定
            if correctPercentage < 30 {
                levelLavel.text = "猿レベル"
                levelImage.image = UIImage(named:"bad")
            } else if correctPercentage >= 30 && correctPercentage < 90 {
                levelLavel.text = "一般人レベル"
                levelImage.image = UIImage(named:"normal")
            } else if correctPercentage >= 90 {
                levelLavel.text = "天才レベル"
                levelImage.image = UIImage(named:"good")
            }
            //実際の正答率を表示
            percentageLabel.text = String(format:"%d %%", correctPercentage)
            // ▲▲ 追加 ▲▲
        }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
