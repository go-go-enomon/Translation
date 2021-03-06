//
//  ResultViwController.swift
//  Translation
//
//  Created by 榎本拓馬 on 2015/06/18.
//  Copyright (c) 2015年 榎本拓馬. All rights reserved.
//


import Foundation

import UIKit

class ResultViewController: UIViewController , UITextViewDelegate {
    // ラベルをアウトプット接続
    @IBOutlet weak var myLabel: UILabel!
    // 遷移時の受け取り用の変数
    var second: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // データを用意して保存
        var saveData = ["いらっしゃいませ"/*key1*/: "おいでやす"/*data1*/, "だめだ": "あかん", "ありがとう": "おおきに", "ごはん": "まんま", "苦しい": "しんどい", "本当に": "ほんまに", "何": "なんやねん", "なにしてんの": "なにしてはんの", "じゃん": "やん", "マック": "マクド", "したよ": "したで", "いいね": "ええなあ", "どうしたの": "どうしたん", "しない": "せーへん"]
        //saveDataの標準語だけを抜き出してkeyArrayに格納
        var keyArray = Array(saveData.keys)
        //keyArrayの要素をhyoujyunWordに入れてfor文を回す
        for hyoujyunWord in keyArray {
            if hyoujyunWord == self.second {
                self.myLabel.text = saveData[hyoujyunWord]
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segue2") {
            // SecondViewControllerクラスをインスタンス化してsegue（画面遷移）で値を渡せるようにバンドルする
            var exampleView : ExampleViewController = segue.destinationViewController as! ExampleViewController
            // ExampleView（バンドルされた変数）に受け取り用の変数を引数とし_paramを渡す（_paramには渡したい値）
            // この時ResultViewControllerにて受け取る同型の変数を用意しておかないとエラーになる
            exampleView.example = self.myLabel.text
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
