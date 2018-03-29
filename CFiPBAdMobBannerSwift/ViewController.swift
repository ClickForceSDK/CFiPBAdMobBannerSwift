//
//  ViewController.swift
//  CFiPBAdMobBannerSwift
//
//  Created by 郭堯彰 on 2018/3/29.
//  Copyright © 2018年 cf. All rights reserved.
//

import UIKit
import iMFAD

class ViewController: UIViewController {

    var banner:MFBannerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let point = CGPoint(x: (self.view.frame.size.width-320)/2, y: self.view.frame.size.height-50)
        banner = MFBannerView.init(adSize: MFAdSize320X50, origin: point);
        banner?.bannerId = "7291";
        banner?.rootViewController = self;
        banner?.delegate = self;
        banner?.setAdAutoRefresh(true);
        self.view.addSubview(banner!);
        banner?.requestAd();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:MFBannerDelegate{
    
    func requestAdSuccess() {
        //顯示banner廣告
        banner?.show();
    }
    
    func requestAdFail() {
        print("請求廣告失敗");
    }
    
    func onClickAd() {
        print("Click Ad");
    }
    
    func onPbAd(_ pbAdView: UIView!) {
        self.view.addSubview(pbAdView);
    }
}

