//
//  AsyncViewController.swift
//  GCD1
//
//  Created by apple on 15/8/10.
//  Copyright (c) 2015年 iCumpus. All rights reserved.
//

import UIKit

class AsyncViewController: UIViewController {
    var imageView = UIImageView(frame: CGRectMake(40, 40, 200, 200));
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        imageView.contentMode = UIViewContentMode.ScaleToFill
        self.view.addSubview(imageView)
        
        let url = "http://f.hiphotos.baidu.com/image/pic/item/e1fe9925bc315c60191d32308fb1cb1348547760.jpg"
        let imageURL = NSURL(string: url)
        var globalQueueDefault = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_sync(globalQueueDefault){
            var imageData = NSData(contentsOfURL:imageURL!)
            var image = UIImage(data: imageData!)
            if let successfulImage = image{
                sleep(2)
                dispatch_async(dispatch_get_main_queue()){
                    self.imageView.image = successfulImage
                }
            }
        }
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
