//
//  MemoViewController.swift
//  MemoPad
//
//  Created by 小西夏穂 on 2017/09/10.
//  Copyright © 2017年 小西夏穂. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = saveData.object(forKey: "title") as? String
        contentTextView.text = saveData.object(forKey: "content") as? String
        titleTextField.delegate = self
    }
    
    
    
    @IBAction func saveMemo() {
        // UserDefaultsに書き込み
        saveData.set(titleTextField.text, forKey: "title")
        saveData.set(contentTextView.text, forKey: "content")
        saveData.synchronize()
        
        //alertを出す
        let alert: UIAlertController = UIAlertController(title: "保存",
        message: "メモの保存が完了しました。",
        preferredStyle: .alert)
        
        //OKボタン
        alert.addAction(
            UIAlertAction(
                title:"OK",
                style: UIAlertActionStyle.default,
                handler: { action in
                    //ボタンが押された時の動作
                    self.navigationController!.popViewController(animated: true)
                    
            }
            )
        )
        present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
