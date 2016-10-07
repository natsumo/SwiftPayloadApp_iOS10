//
//  ViewController.swift
//  SwiftPayloadApp
//
//  Created by Natsumo Ikeda on 2016/10/07.
//  Copyright © 2016年 NIFTY Corporation. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // テーブル
    @IBOutlet weak var payloadTableView: UITableView!
    // AppDelegate
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    // テーブルのCell数
    var numberOfCells = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // AppDelegate
        appDelegate.viewController = self
        
        if appDelegate.payload_flag {
            // テーブルを表示
            getTable()
        }
        
    }
    
    // テーブルの内容を取得
    func getTable() {
        // テーブルのCell数を設定
        numberOfCells = appDelegate.payloadKeyData.count
        // テーブルの設定
        payloadTableView.delegate = self
        payloadTableView.dataSource = self
        // テーブルの更新
        self.payloadTableView.reloadData()
        
    }
    
    // テーブルの表示件数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfCells = appDelegate.payloadKeyData.count
        
        return numberOfCells
    }
    
    // テーブルにCellデータを設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cellを取得
        let cell = payloadTableView.dequeueReusableCell(withIdentifier: "payloadCell", for: indexPath) as! TableViewCell
        cell.setCell(cell: indexPath.row)
        
        return cell
    }
    
    // 画面クリア
    @IBAction func clearScreen(_ sender: UIButton) {
        // 値をクリア
        numberOfCells = 0
        appDelegate.payload_flag = false
        appDelegate.payloadKeyData = []
        appDelegate.payloadValueData = []
        // テーブル更新
        self.payloadTableView.reloadData()
        
    }

    // キーボードを閉じる
    @IBAction func tapScreen(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        
    }

}
