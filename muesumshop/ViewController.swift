//
//  ViewController.swift
//  muesumshop
//
//  Created by 조만묵 on 2016. 1. 7..
//  Copyright © 2016년 조만묵. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var probarLabel: UILabel!
    @IBOutlet weak var proBar: UIProgressView!
    var timer = NSTimer();
    var bcnt:Float = 0.0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proBar.progress = 0;
        probarLabel.text = "시스템 준비중입니다.....";
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "countUp", userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func countUp(){
        
        switch bcnt {
        case 0.2:
            print("GCM 체크")
            probarLabel.text = "GCM 코드 체크"
            if muesumvar.deviceTokenString != ""{
                bcnt += 0.1;
            }
            print(muesumvar.deviceTokenString)
            break
        case 0.4:
            probarLabel.text = "모듈체크 ..."
            bcnt += 0.1;
            proBar.progress = bcnt;
            break
        case 0.6:
            probarLabel.text = "화면준비중 ..."
            bcnt += 0.1;
            proBar.progress = bcnt;
            break
        default:
            bcnt += 0.1;
            proBar.progress = bcnt;
            break;
        }
        if(bcnt > 1.0){
            timer.invalidate();
            print("타이머 종료")
            
            let uvc = self.storyboard?.instantiateViewControllerWithIdentifier("vc02");
            uvc?.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal;
            self.presentViewController(uvc!, animated: true, completion: nil)
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

