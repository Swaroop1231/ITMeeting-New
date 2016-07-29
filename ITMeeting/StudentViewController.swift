//
//  StudentViewController.swift
//  ITMeeting
//
//  Created by test on 29/07/16.
//  Copyright © 2016 ITMeeting. All rights reserved.
//

import UIKit

class StudentViewController: UIViewController {

    @IBOutlet weak var attendingMeetingBtn: UIButton!
    @IBOutlet weak var companyListBtn: UIButton!
    
    @IBOutlet weak var favouriteBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.attendingMeetingBtn.layer.borderColor = whitecolor().CGColor
        self.attendingMeetingBtn.layer.borderWidth = 1.0
        self.attendingMeetingBtn.layer.cornerRadius = 5
        
        
        self.companyListBtn.layer.borderColor = whitecolor().CGColor
        self.companyListBtn.layer.borderWidth = 1.0
        self.companyListBtn.layer.cornerRadius = 5
        
        self.favouriteBtn.layer.borderColor = whitecolor().CGColor
        self.favouriteBtn.layer.borderWidth = 1.0
        self.favouriteBtn.layer.cornerRadius = 5
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func favouriteMeetingActiom(sender: AnyObject) {
    }
    func whitecolor()->UIColor
    {
        
        return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        
    }

    
    @IBAction func companyListButtonAction(sender: AnyObject) {
    }

    @IBAction func attendingMeetingBtnAction(sender: AnyObject) {
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
