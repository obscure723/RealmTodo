//
//  AddViewController.swift
//  RealmTodo
//
//  Created by yonekan on 2018/09/17.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    let todo = Todo()
    
    @IBAction func add(_ sender: UIButton) {
        
        todo.create(title: textField.text!)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
