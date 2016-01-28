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
    internal var timer = NSTimer();
    var bcnt:Float = 0.0;
    var loadCnt:Float = 0.0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proBar.progress = 0;
        probarLabel.text = "시스템 준비중입니다.....";
        timerStart()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func timerStart(){
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "countUp", userInfo: nil, repeats: true)
    }
    func countUp(){
        if InternetCheck.isConnectedToNetwork() == true{
        switch bcnt {
        case 0.2:
            print("GCM 체크")
            probarLabel.text = "GCM 코드 체크"
            loadCnt += 1;
            if muesumvar.deviceTokenString != ""{
                bcnt += 0.1;
            }else{
                loadCnt += 1;
                if loadCnt == 10.0 {
                    stopApp()
                }
            }
            print("로드카운터 : \(loadCnt)")
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
        }else{
            stopApp()
        }

    }
    func stopApp(){
        timer.invalidate();
        print("에러로 인한 타이머 종료")
        let connectAlert = UIAlertController(title: "Alert", message: "You can not connect to the server. To try again , press the OK", preferredStyle: .Alert)
        connectAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) in
            print("다시 시도");
            self.loadCnt = 0.0
            self.timerStart()
        }))
        
        presentViewController(connectAlert, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

