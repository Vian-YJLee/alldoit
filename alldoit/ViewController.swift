//
//  ViewController.swift
//  alldoit
//
//  Created by LeeYongJin on 29/08/2018.
//  Copyright © 2018 vian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblHello: UILabel!
    @IBOutlet weak var txtName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        
        lblHello.text = "Hello, " + txtName.text!
        
        //lbl txt changing
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let Next = segue.destination as! DatepicView
    }
    
    @IBAction func backhome(segue: UIStoryboardSegue)
    {
        
    }
}

