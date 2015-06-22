//
//  ResultViwController.swift
//  Translation
//
//  Created by 榎本拓馬 on 2015/06/18.
//  Copyright (c) 2015年 榎本拓馬. All rights reserved.
//

import Foundation

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var ResultTextlabel: UILabel!
    
    
    
    
    @IBAction func result(){
        
        let myDefault = NSUserDefaults.standardUserDefaults()
        
        // 再度読み出し
        if let readDict = myDefault.objectForKey("save") as? [String: String] {
            let readData: String! = readDict["いらっしゃいませ"]
            let readData2: String! = readDict["だめだ"]
            let readData3: String! = readDict["ありがとう"]
            ResultTextlabel.text = "\(readData)"
            ResultTextlabel.text = "\(readData2)"
            ResultTextlabel.text = "\(readData3)"
        } else {
            ResultTextlabel.text = "No such Data"
        }
        /*
        Data of key1 = data
        Data of key2 = data2
        Data of key3 = nil
        */
        
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
//        var message = appDelegate.message
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
