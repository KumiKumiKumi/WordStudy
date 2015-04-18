//
//  ViewController.swift
//  WordStudy
//
//  Created by KumiHamazaki on 2015/04/18.
//  Copyright (c) 2015年 KumiHamazaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var labelQ: UILabel = UILabel(frame: CGRectZero)
    var labelA: UILabel = UILabel(frame: CGRectZero)
    let buttonAns = UIButton()
    let buttonNext = UIButton()
    
    let wordJ : [String] = ["りんご", "みかん", "ぶどう", "メロン"]
    let wordE : [String] = ["apple", "orange", "grape", "melon"]
    
    var randInt: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setAnsButton()
        setNextButton()
        
        showQuestion()
        self.buttonAns.hidden = false //buttonAnsを表示
    }
    
    
    func onClickShowAnsButton(sender: UIButton){ //ボタンが押された時の処理
        showAnswer()
    }
    
    func onClickNextButton(sender: UIButton){
        hideQuestion()
        hideAnswer()
        showQuestion()
    }
    
    func makeQuestion(){
        var r = Int(arc4random() % 4)
        while randInt == r {
            r = Int(arc4random() % 4)
        }
        randInt = r
    }
    
    func showQuestion(){
        makeQuestion()
        labelQ.text = String(wordE[randInt])
        labelQ.sizeToFit()
        labelQ.center = CGPointMake(80, 100) //表示位置
        self.view.addSubview(labelQ)
        self.buttonNext.hidden = true //buttonNextを隠す
        self.buttonAns.hidden = false //buttonAnsを表示
    }
    
    func hideQuestion(){
        labelQ.text = ""
        labelQ.sizeToFit()
        labelQ.center = CGPointMake(80, 100) //表示位置
        self.view.addSubview(labelQ)
    }
    
    
    func showAnswer(){
        labelA.text = String(wordJ[randInt])
        labelA.sizeToFit()
        labelA.center = CGPointMake(240, 100) //表示位置
        self.view.addSubview(labelA)
        self.buttonAns.hidden = true //buttonAnsを隠す
        self.buttonNext.hidden = false //buttonNextを表示
    }
    
    func hideAnswer(){
        labelA.text = ""
        labelA.sizeToFit()
        labelA.center = CGPointMake(240, 100) //表示位置
        self.view.addSubview(labelA)
    }
    
    func setAnsButton(){
        buttonAns.setTitle("答えを表示", forState: .Normal) //表示されるテキスト
        buttonAns.setTitleColor(UIColor.redColor(), forState: .Normal) //テキストの色
        buttonAns.frame = CGRectMake(0, 0, 100, 30) //サイズ
        buttonAns.tag = 1 //タグ番号
        buttonAns.layer.position = CGPoint(x: self.view.frame.width/2, y:150) //配置場所
        buttonAns.backgroundColor = UIColor(red: 0.7, green: 0.2, blue: 0.2, alpha: 0.2) //背景色
        buttonAns.layer.cornerRadius = 10 //角丸
        buttonAns.addTarget(self, action: "onClickShowAnsButton:", forControlEvents:.TouchUpInside) //タップした時のメソッド
        self.view.addSubview(buttonAns)
        self.buttonAns.hidden = true //buttonAnsを隠す
    }
    
    
    func setNextButton(){
        buttonNext.setTitle("次の問題", forState: .Normal) //表示されるテキスト
        buttonNext.setTitleColor(UIColor.blueColor(), forState: .Normal) //テキストの色
        buttonNext.frame = CGRectMake(0, 0, 100, 30) //サイズ
        buttonNext.tag = 1 //タグ番号
        buttonNext.layer.position = CGPoint(x: self.view.frame.width/2, y:150) //配置場所
        buttonNext.backgroundColor = UIColor(red: 0.1, green: 0.2, blue: 0.8, alpha: 0.2) //背景色
        buttonNext.layer.cornerRadius = 10 //角丸
        buttonNext.addTarget(self, action: "onClickNextButton:", forControlEvents:.TouchUpInside) //タップした時のメソッド
        self.view.addSubview(buttonNext)
        self.buttonNext.hidden = true //buttonNextを隠す
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


