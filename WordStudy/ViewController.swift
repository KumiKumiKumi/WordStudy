//
//  ViewController.swift
//  WordStudy
//
//  Created by KumiHamazaki on 2015/04/18.
//  Copyright (c) 2015年 KumiHamazaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource , UIToolbarDelegate {
    var labelQ: UILabel = UILabel(frame: CGRectZero)
    var labelA: UILabel = UILabel(frame: CGRectZero)
    let buttonAns = UIButton()
    let buttonNext = UIButton()
    let buttonSelectLang = UIButton()
    
    let wordJ : [String] = ["りんご", "みかん", "ぶどう", "メロン"]    
    var myValues : NSArray = ["英語","ドイツ語", "フランス語", "イタリア語"]
    var chooseLang: Int = 0
    let labelLang: UILabel = UILabel(frame: CGRectMake(0,0,200,30))
    
    var randInt: Int = 0
    
    var myUIPicker: UIPickerView = UIPickerView()
    var myToolBar: UIToolbar!
    var textShowLang: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setDesign() //デザインの設定
        setLangButton() //言語選択ボタン表示
        setUIPicherView() //ピッカービューの設定
        setLangLabel() //言語ラベルを表示
        
        setAnsButton()
        setNextButton()
        
        showQuestion()
    }
    
    
    func onClickShowAnsButton(sender: UIButton){ //「答えを表示」ボタンが押された時の処理
        showAnswer()
    }
    
    func onClickNextButton(sender: UIButton){ //「次の問題」ボタンが押された時の処理
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
        labelQ.text = String(setLang()[randInt])
        labelQ.sizeToFit()
        labelQ.center = CGPointMake(80, 150) //表示位置
        self.view.addSubview(labelQ)
        self.buttonNext.hidden = true //buttonNextを隠す
        self.buttonAns.hidden = false //buttonAnsを表示
    }
    
    func setLang() -> [String]{
        let wordE : [String] = ["apple", "orange", "grape", "melon"]
        let wordG : [String] = ["Apfeu", "Apfelsine", "Weintraube", "Melon"]
        let wordF : [String] = ["Pomme", "Mandarine orange", "Raisin", "Melon"]
        let wordI : [String] = ["Apple", "Mandarino arancione", "Mandarino arancino", "Melon"]
        
        if chooseLang==0  { return wordE }
        else if chooseLang==1  { return wordG }
        else if chooseLang==2  { return wordF }
        else  { return wordI }
    }
    
    func hideQuestion(){
        labelQ.text = ""
        labelQ.sizeToFit()
        labelQ.center = CGPointMake(80, 150) //表示位置
        self.view.addSubview(labelQ)
    }
    
    
    func showAnswer(){
        labelA.text = String(wordJ[randInt])
        labelA.sizeToFit()
        labelA.center = CGPointMake(240, 150)
        self.view.addSubview(labelA)
        self.buttonAns.hidden = true //buttonAnsを隠す
        self.buttonNext.hidden = false //buttonNextを表示
    }
    
    func hideAnswer(){
        labelA.text = ""
        labelA.sizeToFit()
        labelA.center = CGPointMake(240, 150) //表示位置
        self.view.addSubview(labelA)
    }
    
    func setAnsButton(){
        buttonAns.setTitle("答えを表示", forState: .Normal) //表示されるテキスト
        buttonAns.setTitleColor(UIColor.redColor(), forState: .Normal) //テキストの色
        buttonAns.frame = CGRectMake(0, 0, 100, 30) //サイズ
        buttonAns.tag = 1 //タグ番号
        buttonAns.layer.position = CGPoint(x: self.view.frame.width/2, y:200) //配置場所
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
        buttonNext.layer.position = CGPoint(x: self.view.frame.width/2, y:200) //配置場所
        buttonNext.backgroundColor = UIColor(red: 0.1, green: 0.2, blue: 0.8, alpha: 0.2) //背景色
        buttonNext.layer.cornerRadius = 10 //角丸
        buttonNext.addTarget(self, action: "onClickNextButton:", forControlEvents:.TouchUpInside) //タップした時のメソッド
        self.view.addSubview(buttonNext)
        self.buttonNext.hidden = true //buttonNextを隠す
        
    }
    
    /********** 言語選択ボタンの制御 ************/
    func setLangButton(){
        buttonSelectLang.setTitle("言語の選択", forState: .Normal) //表示されるテキスト
        buttonSelectLang.setTitleColor(UIColor.brownColor(), forState: .Normal) //テキストの色
        buttonSelectLang.frame = CGRectMake(0, 0, 320, 30) //サイズ
        buttonSelectLang.tag = 1 //タグ番号
        buttonSelectLang.layer.position = CGPoint(x: self.view.frame.width/2, y:270) //配置場所
        buttonSelectLang.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6) //背景色
        buttonSelectLang.layer.cornerRadius = 0 //角丸
        buttonSelectLang.addTarget(self, action: "onClickLangButton:", forControlEvents:.TouchUpInside) //タップした時のメソッド
        self.view.addSubview(buttonSelectLang)
        
    }

    func onClickLangButton(sender: UIButton){  //言語選択ボタンのイベント
        textShowLang.becomeFirstResponder() //言語のテキストフィールドにフォーカスを当てる
    }
    
    func setLangLabel(){ //言語を表示
        labelLang.layer.masksToBounds = true
        labelLang.layer.cornerRadius = 10.0
        labelLang.text = myValues[0]as? String
        labelLang.textColor = UIColor.orangeColor()
        labelLang.textAlignment = NSTextAlignment.Center
        labelLang.layer.position = CGPoint(x: self.view.bounds.width/2,y: 110) //配置設定
        self.view.addSubview(labelLang)
    }
    
    func changeLangLabel(){
        labelLang.text = myValues[chooseLang]as? String
    }

    
    
    /********** ピッカービューの指定 **********/
    
    func setUIPicherView(){
        
        //TextField作成
        textShowLang = UITextField(frame: CGRectMake(130, 300, 0, 0)) //(x座標, y座標, width, height)
        textShowLang.placeholder = myValues[0] as? String;
        textShowLang.text = ""
        self.view.addSubview(textShowLang)

        //PickerView作成
        myUIPicker.showsSelectionIndicator = true
        myUIPicker.delegate = self // Delegateを設定する.
        
        myUIPicker = UIPickerView()
        myUIPicker.showsSelectionIndicator = true
        myUIPicker.delegate = self
        
        
        //ToolBar作成。ニョキ担当
        myToolBar = UIToolbar(frame: CGRectMake(0, self.view.frame.size.height/6, self.view.frame.size.width, 40.0))
        myToolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        myToolBar.backgroundColor = UIColor.blackColor()
        myToolBar.barStyle = UIBarStyle.Black
        myToolBar.tintColor = UIColor.whiteColor()
        
        //ToolBarを閉じるボタンを追加
        let myToolBarButton = UIBarButtonItem(title: "Close", style: .Bordered, target: self, action: "onClick:")
        myToolBarButton.tag = 1
        myToolBar.items = [myToolBarButton]
        
        //TextFieldをpickerViewとToolVerに関連づけ
        textShowLang.inputView = myUIPicker
        textShowLang.inputAccessoryView = myToolBar
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {  //表示例
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { //表示個数
        return myValues.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! { //表示内容
        return myValues[row] as? String;
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) { //選択時
        println(row)
        chooseLang = row
        changeLangLabel()
        showQuestion()
    }
    
    func onClick(sender: UIBarButtonItem) {
        textShowLang.resignFirstResponder()
    }
    
    
    //***********デザインの指定************//
    
    func setDesign(){
        setTitle()
        setBackGround2()
    }
    
    func setTitle(){ //タイトルを表示
        let labelTitle: UILabel = UILabel(frame: CGRectMake(0,0,200,30))
        labelTitle.backgroundColor = UIColor.orangeColor()
        labelTitle.layer.masksToBounds = true
        labelTitle.layer.cornerRadius = 10.0
        labelTitle.text = "単語練習"
        labelTitle.textColor = UIColor.whiteColor()
        labelTitle.shadowColor = UIColor.grayColor()
        labelTitle.textAlignment = NSTextAlignment.Center
        labelTitle.layer.position = CGPoint(x: self.view.bounds.width/2,y: 70) //配置設定
        self.view.addSubview(labelTitle)
    }
    
    func setBackGround(){
        var myScrollView = UIScrollView();
        
        myScrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        
        // UIImageに画像を設定する.
        let myImage = UIImage(named: "/Applications/4semi/WordStudy/image_WrodStudy/IMG_1134.JPG")!
        
        // UIImageViewを生成する.
        var myImageView = UIImageView()
        
        // myImageViewのimageにmyImageを設定する.
        myImageView.image = myImage
        
        // frameの値を設定する.
        myImageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        
        // ScrollViewにmyImageViewを追加する.
        myScrollView.addSubview(myImageView)
        
        // ScrollViewにcontentSizeを設定する.
        myScrollView.contentSize = CGSizeMake(myImageView.frame.size.width, myImageView.frame.size.height)
        
        // ViewにScrollViewをAddする.
        self.view.addSubview(myScrollView)
        
        setBackGroundsLabel()
        
    }
    
    func setBackGround2(){
        self.view.backgroundColor = UIColor.yellowColor()
        setBackGroundsLabel()
    }
    
    func setBackGroundsLabel(){
        //ラベルでできた背景の設定
        var labelBackGround: UILabel = UILabel(frame: CGRectMake(0,0,260,480))
        labelBackGround.text = ""
        labelBackGround.backgroundColor = UIColor(red: 0.8, green: 0.2, blue: 0.2, alpha: 0.2) //ラベルの背景色の設定
        labelBackGround.layer.masksToBounds = true //枠を丸くする
        labelBackGround.layer.cornerRadius = 20.0 //角の半径
        labelBackGround.center = CGPointMake(159, 280)
        self.view.addSubview(labelBackGround)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


