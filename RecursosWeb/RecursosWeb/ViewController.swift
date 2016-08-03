//
//  ViewController.swift
//  RecursosWeb
//
//  Created by AlexGarcia on 7/20/16.
//  Copyright © 2016 AlexGarcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var isbn: UITextField!
    
    @IBOutlet weak var resultado: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        isbn.delegate = self
        isbn.clearButtonMode = UITextFieldViewMode.Always
        resultado.text = ""
    }
    
    @IBAction func textFieldDidEndEditing(sender: UITextField) {
        sender.resignFirstResponder()
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + isbn.text!
        //978-84-376-0494-7
        let url = NSURL(string: urls)
        if url != nil {
            let datos : NSData? = NSData(contentsOfURL: url!)
            if datos != nil {
                let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
                self.resultado.text = texto! as String
            }
            else {
                self.resultado.text = "Error en conexión. Verifique que este conectado a internet."
            }
        }
        else {
            resultado.text = "No se localizó el ISBN: " + isbn.text!
        }
    }
    
    @IBAction func backgroundTap(sender : UIControl)
    {
        isbn.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

