//
//  ExampleViewController.swift
//  Translation
//
//  Created by 榎本拓馬 on 2015/06/18.
//  Copyright (c) 2015年 榎本拓馬. All rights reserved.
//

import Foundation

import UIKit

class ExampleViewController: UIViewController {
    
    
    /// ラベルをアウトプット接続
    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var exampleLabel2: UILabel!
    /// 遷移時の受け取り用の変数
    var example: String!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // データを用意して保存
        var saveData2 = ["おいでやす"/*key1*/:"ようこそいらっしゃいませ。"/*data1*/, "あかん": "もう私だめだ･･･", "おおきに": "6期iPhoneの皆さん今までありがとう！", "まんま": "このごはんおいしいですね。", "しんどい": "あなたのこと考えすぎて胸が苦しいよ。"]
        //saveData2の標準語だけを抜き出してkeyArray2に格納
        var keyArray2 = Array(saveData2.keys)
        //keyArray2の要素をhyoujyunWord2に入れてfor文を回す
        for hyoujyunWord2 in keyArray2 {
            if hyoujyunWord2 == self.example {
                self.exampleLabel.text = saveData2[hyoujyunWord2]
            }
        }
    
        // データを用意して保存
        var saveData3 = ["おいでやす"/*key1*/:"ようこそおいでやす。"/*data1*/, "あかん": "もううちあかん･･･", "おおきに": "6期iPhoneのみんなおおきに！", "まんま": "このまんまおいしおすなあ。", "しんどい": "うち、あんたのこと考えすぎて胸がしんどいねん。"]
        //saveData2の標準語だけを抜き出してkeyArray2に格納
        var keyArray3 = Array(saveData3.keys)
        //keyArray2の要素をhyoujyunWord2に入れてfor文を回す
        for hyoujyunWord3 in keyArray3 {
            if hyoujyunWord3 == self.example {
                self.exampleLabel2.text = saveData3[hyoujyunWord3]
            }
        }

        
        
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
