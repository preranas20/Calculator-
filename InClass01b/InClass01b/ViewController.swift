//
//  ViewController.swift
//  InClass01b
//
//  Created by Prerana Singh on 10/23/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//

/*Assignment: InClass01b
 ViewControlller.swift
 Submitted by:Prerana Singh(800973733)
 */


import UIKit

class ViewController: UIViewController {

    @IBOutlet var textFirstNo: UITextField!
    @IBOutlet var textSecondNo: UITextField!
    @IBOutlet var labelResult: UILabel!
    @IBOutlet var segmentedOperator: UISegmentedControl!
    var num1 = 0.00
    var num2 = 0.00
    var result = 0.00
    var symbol:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
      //  textFirstNo.delegate = self as! UITextFieldDelegate
       // textSecondNo.delegate = self as! UITextFieldDelegate
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func btnPerformOperation(_ sender: Any) {
        
        
        if(textFirstNo.text == ""||textSecondNo.text == ""){
             self.labelResult.text = "0.00"
            let alert = UIAlertController(title: "Error", message: "Fields cannot be empty", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
        else{
            
            if let number1 = Double(textFirstNo.text!){
                
                num1 = number1
                
            }
            
            if let number2 = Double(textSecondNo.text!){
                
                num2 = number2
                
                
            }
            
            switch symbol{
           /* case "Add":
                result = num1+num2
                labelResult.text=String(result)*/
               
            case "Subtract":
                result = num1 - num2
                labelResult.text=String(result)
            case "Multiply":
                result = num1 * num2
                labelResult.text=String(result)
            case "Divide":
                if(num2 == 0)
                {
                    self.labelResult.text = "0.00"
                    let alert = UIAlertController(title: "Error", message: "Division by Zero is not allowed", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    
                    self.present(alert, animated: true)
                    
                }else{
                    
                    result = num1 / num2
                    labelResult.text=String(result)
                }
            default:
                result = num1+num2
                labelResult.text=String(result)
                
                
            }
            
         
        }
    }
        
    @IBAction func segmentedOperation(_ sender: UISegmentedControl) {
        switch segmentedOperator.selectedSegmentIndex{
        
        case 1:
            symbol = "Subtract"
        case 2:
            symbol = "Multiply"
        case 3:
            symbol = "Divide"
        default:
            symbol = "Add"
        }
    
    
    }
    

    @IBAction func btnClear(_ sender: UIButton) {
        textFirstNo.text = ""
        textSecondNo.text = ""
        labelResult.text = "0.00"
        num1 = 0.00
        num2 = 0.00
    }
    /* */
    
    
       
    
}

