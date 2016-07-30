//
//  ViewController.swift
//  ITMeeting
//
//  Created by test on 29/07/16.
//  Copyright © 2016 ITMeeting. All rights reserved.
//




import UIKit

class ViewController: UIViewController
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
        //UINavigationBar.appearance().barTintColor = UIColor.brownColor()
        self.title = "Login"
      //  UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]

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

        
        nameTextfield.attributedPlaceholder = NSAttributedString(string:"User Name", attributes: [NSForegroundColorAttributeName: whitecolor()])
        passwordtextfield.attributedPlaceholder = NSAttributedString(string:"Password", attributes: [NSForegroundColorAttributeName: whitecolor()])
        
     
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        return textField.resignFirstResponder()
    }
    
    
    @IBAction func loginAction(sender: AnyObject)
    {
        let coredataObj = CoreDataHelper()
        
       let boolVal =  coredataObj.fetchStudentDetails(nameTextfield.text!, password: passwordtextfield.text!)
        
        if  boolVal==true
        {
            let detail = self.storyboard?.instantiateViewControllerWithIdentifier("StudentViewController") as! StudentViewController
            self.navigationController?.pushViewController(detail, animated: true)
        }
        else
        {
            
            let alertController = UIAlertController(title: "Alert.!", message: "Please check login details.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)

        }
        
        
    }
    
    func whitecolor()->UIColor
    {
    
        return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

