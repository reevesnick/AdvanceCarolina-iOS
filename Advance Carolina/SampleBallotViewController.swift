//
//  SampleBallotViewController.swift
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 3/8/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit
import Foundation


class SampleBallotViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let localfilePath = NSBundle.mainBundle().URLForResource("pdf",withExtension: "pdf");
        let myRequest = NSURLRequest(URL: localfilePath!);
        webView.loadRequest(myRequest);
        
        //Zoom in aod out web view
        let contentSize:CGSize = webView.scrollView.contentSize
        let viewSize:CGSize = self.view.bounds.size
        
        let rw = viewSize.width / contentSize.width;
        
        webView.scrollView.minimumZoomScale = rw;
        webView.scrollView.zoomScale = rw;
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
