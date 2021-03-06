//
//  ResultViewController.swift
//  Alj100M_iino
//
//  Created by 飯野日向子 on 2020/06/16.
//  Copyright © 2020 ALJ飯野日向子. All rights reserved.
//

import UIKit
import Social

class ResultViewController: UIViewController {

    @IBOutlet weak var Kirokukousin: UILabel!
    
    @IBOutlet weak var TimerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //CountTimerを文字列へ変換してTimerLabel.textへ代入する(小数点2桁で表示)
        TimerLabel.text = NSString(format:"%.2f秒",CountTimer) as String
    }

    
    
  //FaceBook
  @IBAction func FacebookButton(sender: AnyObject) {
     let text = "結果タイム" + TimerLabel.text!
            let composeViewController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
            composeViewController.setInitialText(text)
            self.present(composeViewController, animated: true, completion: nil)
        
  }
    
  //Tweet
  @IBAction func TweetButton(sender: AnyObject) {
     let text = "結果タイム" + TimerLabel.text!
           let composeViewController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
           composeViewController.setInitialText(text)
           self.present(composeViewController, animated: true, completion: nil)
  }
    
  //Line
  @IBAction func LineButton(sender: AnyObject) {
    let text: String! = "結果タイム" + TimerLabel.text!
           let encodeMessage: String! = text.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
           let messageURL: NSURL! = NSURL( string: "line://msg/text/" + encodeMessage )
           if (UIApplication.shared.canOpenURL(messageURL as URL)) {
               UIApplication.shared.openURL( messageURL as URL )
          
    }
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
