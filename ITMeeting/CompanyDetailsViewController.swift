//
//  CompanyDetailsViewController.swift
//  ITMeeting
//
//  Created by test on 29/07/16.
//  Copyright © 2016 ITMeeting. All rights reserved.
//

import UIKit
import EventKit
class CompanyDetailsViewController: UIViewController {

    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var datelabel: UILabel!
    
    @IBOutlet weak var timelabel: UILabel!
    
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var remainderBtn: UIButton!
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var addFavBtn: UIButton!
    
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var meetDesc: UILabel!
    
    var idStr = Int()
    var setWebsite = String()
    //var eventStore: EKEventStore!

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

      //  UINavigationBar.appearance().barTintColor = UIColor.brownColor()
        self.title = "Company Details"
             // UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.remainderBtn.layer.borderColor = whitecolor().CGColor
        self.remainderBtn.layer.borderWidth = 1.0
        self.remainderBtn.layer.cornerRadius = 5
        
        self.applyButton.layer.borderColor = whitecolor().CGColor
        self.applyButton.layer.borderWidth = 1.0
        self.applyButton.layer.cornerRadius = 5
        
        self.addFavBtn.layer.borderColor = whitecolor().CGColor
        self.addFavBtn.layer.borderWidth = 1.0
        self.addFavBtn.layer.cornerRadius = 5
        
        
        let coredataObj = CoreDataHelper()
        
        let c = String(idStr)
        
       let companies = coredataObj.fetchParticularCompanyDetails(c)
        
        
        
        if let name = companies!.name
        {
            self.companyName.text = name
        }
        
        
        
        self.datelabel.text = companies!.date
        self.meetDesc.text = companies!.meetingdescription
        self.timelabel.text = companies!.time
        self.locationLabel.text = companies!.location
        setWebsite=companies!.website!
        
        
        if companies!.offeringintern == "YES"
        {
            applyButton.hidden=false
            checkImageView.image = UIImage.init(named: "check")
        }
        else
        {
            applyButton.hidden=true
            checkImageView.image = UIImage.init(named: "cross")
        }
        
        let logButton : UIBarButtonItem = UIBarButtonItem(title: "Signout", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(StudentViewController.logout))
        self.navigationItem.rightBarButtonItem = logButton
        
       

        // Do any additional setup after loading the view.
    }
    
    func logout()
    {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    func whitecolor()->UIColor
    {
        
        return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        
    }
    
    

    
    @IBAction func addFavAction(sender: AnyObject)
    {
        
        var company1 = [String:String]()
        company1["name"] = companyName.text
        company1["date"] = datelabel.text
        company1["time"] = timelabel.text
        company1["location"] = locationLabel.text
        let c = String(idStr)

        company1["id"] = c
        
        
        
        let coredataObj = CoreDataHelper()
        
        let boolVal = coredataObj.favouriteMeetingDetails(company1)
        
        if  boolVal==true
        {
          //  print("added")
            
            let detail = self.storyboard?.instantiateViewControllerWithIdentifier("AttendingViewController") as! AttendingViewController
            self.navigationController?.pushViewController(detail, animated: true)
            
        }
        else
        {
            print("not")
        }
        

        
    }

    @IBAction func setremainderAction(sender: AnyObject)
    {
    
        createReminder()
    
    }
    
    //MARK: Helper method to convert the NSDate to NSDateComponents
    
    
    @IBAction func applyButtonAction(sender: AnyObject)
    {
     
        if let url = NSURL(string: setWebsite){
            UIApplication.sharedApplication().openURL(url)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createReminder()
    {
        

        
        
        let reminder = EKReminder(eventStore: (UIApplication.sharedApplication().delegate as! AppDelegate).eventStore)
        
        reminder.title = companyName.text!
        reminder.calendar =
            (UIApplication.sharedApplication().delegate as! AppDelegate).eventStore.defaultCalendarForNewReminders()
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        //print (dateFormatter.dateFromString(datelabel.text!))
        
        let date = dateFormatter.dateFromString(datelabel.text!)
        let alarm = EKAlarm(absoluteDate: date!)
        
        reminder.addAlarm(alarm)
        
        
        do
        {
            try (UIApplication.sharedApplication().delegate as! AppDelegate).eventStore.saveReminder(reminder, commit: true)
            dismissViewControllerAnimated(true, completion: nil)
            
            
            let alertController = UIAlertController(title: "Alert.!", message: "Remainder set.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)

        }
        catch
        {
            print("Error creating and saving new reminder : \(error)")
        }
        
//        var error: NSError?
//       (UIApplication.sharedApplication().delegate as! AppDelegate).eventStore.saveReminder(reminder,
//                                              commit: true, error: & error)
//        
//        if error != nil {
//            print("Reminder failed with error \(error?.localizedDescription)")
//        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
