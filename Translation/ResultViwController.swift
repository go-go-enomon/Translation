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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var saveDefault = NSUserDefaults.standardUserDefaults()
        var reserchText = NSUserDefaults.standardUserDefaults()
        
        var readDict = saveDefault.stringForKey("save")
        var resultText = reserchText.stringForKey("reserch")
        
        saveDefault.synchronize()
        reserchText.synchronize()
        
        if resultText = readDict["いらっしゃいませ"] {
            readData = readDict["いらっしゃいませ"]
            ResultTextlabel.text = "\(readData)"
        } else if resultText = readDict["だめだ"] {
            readData2 = readDict["だめだ"]
            ResultTextlabel.text = "\(readData2)"
        } else if resultText = readDict["ありがとう"] {
            readData3 = readDict["ありがとう"]
            ResultTextlabel.text = "\(readData3)"
        } else {
            ResultTextlabel.text = "No such Data"
        }
        
    }
        // 再度読み出し
        /*if let readDict = saveDefault.objectForKey("save") as? [String: String] && resulttext = reserchText.objectForKey("reserch") as? [String: String] {
        
            
           if  reserchText = readDict["いらっしゃいませ"] {
                readData: String! = readDict["いらっしゃいませ"]
                ResultTextlabel.text = "\(readData)"
            } else if let reserchText = readDict["だめだ"] {
                readData2: String! = readDict["だめだ"]
                ResultTextlabel.text = "\(readData2)"
            } else if let reserchText =
                readData3: String! = readDict["ありがとう"] {
                ResultTextlabel.text = "\(readData3)"
            } else {
                ResultTextlabel.text = "No such Data"
            }
            
    
        }
    }*/
        
        
        // 消去
        //        saveDefault.removeObjectForKey("save")
        //        saveDefault.synchronize()
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    //        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    //AppDelegateのインスタンスを取得
    //        var message = appDelegate.message
    
    
    
    
}
