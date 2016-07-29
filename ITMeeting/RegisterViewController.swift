//
//  ViewController.swift
//  ITMeeting
//
//  Created by test on 29/07/16.
//  Copyright © 2016 ITMeeting. All rights reserved.
//




import UIKit

class RegisterViewController: UIViewController
{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordtextfield: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.backView.layer.borderColor = whitecolor().CGColor
        self.backView.layer.borderWidth = 1.0
        self.backView.layer.cornerRadius = 5
        
        
        
        self.nameTextfield.layer.borderColor = whitecolor().CGColor
        self.nameTextfield.layer.borderWidth = 1.0
        self.nameTextfield.layer.cornerRadius = 5
        
        self.passwordtextfield.layer.borderColor = whitecolor().CGColor
        self.passwordtextfield.layer.borderWidth = 1.0
        self.passwordtextfield.layer.cornerRadius = 5
        
        
        
        self.loginButton.layer.borderColor = whitecolor().CGColor
        self.loginButton.layer.borderWidth = 1.0
        self.loginButton.layer.cornerRadius = 5
        
        
        
    }
    
    
    
    func whitecolor()->UIColor
    {
        
        return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        
    }
    
    
    
    
    @IBAction func registerButtonAction(sender: AnyObject)
    {
        let coredataObj = CoreDataHelper()
        
        let boolVal = coredataObj.saveStudentRegisterDetails(nameTextfield.text!, password: passwordtextfield.text!)
        
        if  boolVal==true
        {
            
            
            let alertController = UIAlertController(title: "Alert", message: "Details saved.", preferredStyle: UIAlertControllerStyle.Alert)

            let saveAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:
                {
                alert -> Void in
                    self.navigationController?.popViewControllerAnimated(true)

            })

            alertController.addAction(saveAction)

            self.presentViewController(alertController, animated: true, completion: nil)

            
        }
        

        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

