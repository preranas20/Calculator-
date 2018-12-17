//
//  ViewController.swift
//  InClass01a
//
//  Created by Prerana Singh on 10/23/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//

/*Assignment: InClass01a
 ViewControlller.swift
 Submitted by:Prerana Singh(800973733)
 */

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textFirstNo: UITextField!
    @IBOutlet var textSecondNo: UITextField!
    @IBOutlet var labelResult: UILabel!
    @IBOutlet var UIButtons: [UIButton]!
   
    var num1 = 0.00
    var num2 = 0.00
    var result = 0.00
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textSecondNo.keyboardType = UIKeyboardType.numberPad
        textFirstNo.keyboardType = UIKeyboardType.numberPad
        
    }

    @IBAction func btnClick(_ sender: UIButton) {
        if let operationnumber = UIButtons.lastIndex(of: sender)
        {
           
            if(textFirstNo.text == ""||textSecondNo.text == ""){
                labelResult.text = "0.00"
                showToast(controller: self, message : "Input cannot be empty", seconds: 2.0)
            }
            else{
                
               if let number1 = Double(textFirstNo.text!){
                
                 num1 = number1
                
               }
            
                if let number2 = Double(textSecondNo.text!){
                    
                     num2 = number2
                    
                }
           
            calculateResult(num1:num1, num2:num2, operationnumber:operationnumber)
        }
            
        
        }
        
    }
    
    func calculateResult(num1 operand1:Double,num2 operand2:Double,operationnumber symbol:Int){
       
        switch symbol {
        case 0:
            result = operand1+operand2
            labelResult.text = String(result)
           
        case 1:
            result = operand1-operand2
            labelResult.text = String(result)
           
        case 2:
            result = operand1*operand2
            labelResult.text = String(result)
        case 3:
            if(num2 == 0)
            {
                labelResult.text = "0.00"
                showToast(controller: self, message : "Cannot divide by zero", seconds: 2.0)
            }else{
            
            result = operand1/operand2
            labelResult.text = String(result)
           
            }
            
        default:
            print("Nothing added")
        }
    }
        
    @IBAction func btnClear(_ sender: Any) {
        num1 = 0.00
        num2 = 0.00
        textFirstNo.text = ""
        textSecondNo.text = ""
        labelResult.text = "0.00"
    }
    func showToast(controller: UIViewController, message : String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        
        controller.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
    
}
