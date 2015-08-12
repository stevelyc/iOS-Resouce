//
//  ViewController.swift
//  SerialAndConcurrent
//
//  Created by apple on 15/8/11.
//  Copyright (c) 2015年 iCumpus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func concurrent(sender: UIButton) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){
            for (var i=0; i<5; i++){
                println("First stack: \(i)")
                sleep(1)
            }
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){
            for (var j=0; j<5; j++){
                println("Second stack:\(j)")
                sleep(1)
            }
        }
    }


    @IBAction func Serial(sender: UIButton) {
        var serialQueue = dispatch_queue_create("com.iCampus", DISPATCH_QUEUE_SERIAL)
        dispatch_sync(serialQueue){
            for (var i=0; i<5; i++){
                println("First stack: \(i)")
                sleep(1)
            }
        }
        dispatch_sync(serialQueue){
            for (var j=0; j<5; j++){
                println("Second stack:\(j)")
                sleep(1)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

