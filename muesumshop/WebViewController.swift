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
        WebViewConnect("http://www.muesum.co.kr/shop/index.php")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func WebViewConnect(Url :String){
        webpogress.progress = 0;
        let Url = NSURL(string: Url + "?app=" + muesumvar.deviceOs + "&appvar=" + muesumvar.deviceTokenString);
        let result = NSURLRequest(URL: Url!);
        my.loadRequest(result)
        print(muesumvar.deviceTokenString);
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false;
    }
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true;
    }
    @IBAction func HomeWebView(sender: AnyObject) {
        WebViewConnect("http://www.muesum.co.kr/shop/index.php")
    }
    @IBAction func LoginWebView(sender: AnyObject) {
        WebViewConnect("http://www.muesum.co.kr/shop/member/login.php")
    }
    // MARK: Some Private Methods
    
    private func showError(errorString: String?) {
        let alertView = UIAlertController(title: "Error", message: errorString, preferredStyle: .Alert)
        alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alertView, animated: true, completion: nil)
    }
   
}
