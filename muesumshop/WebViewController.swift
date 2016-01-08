//
//  WebViewController.swift
//  muesumshop
//
//  Created by 조만묵 on 2016. 1. 8..
//  Copyright © 2016년 조만묵. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
    
    
    @IBOutlet weak var webpogress: UIProgressView!
    @IBOutlet weak var my: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webpogress.progress = 0;
        let Url = NSURL(string: "http://www.muesum.co.kr/shop/index.php?app=" + muesumvar.deviceOs + "&appvar=" + muesumvar.deviceTokenString);
        let result = NSURLRequest(URL: Url!);
        my.loadRequest(result)
        print(muesumvar.deviceTokenString);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
