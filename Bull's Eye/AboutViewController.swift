//
//  AboutViewController.swift
//  Bull's Eye
//
//  Created by mac on 15/9/16.
//  Copyright © 2015年 mac. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlFile = NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html") {
            let htmlDate = NSData(contentsOfFile: htmlFile)
            let baseURL = NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath)
            webView.loadData(htmlDate!, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func close() {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
