//
//  CompanyDetailsViewController.swift
//  ITMeeting
//
//  Created by test on 29/07/16.
//  Copyright © 2016 ITMeeting. All rights reserved.
//

import UIKit

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
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
        
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
        
        

        // Do any additional setup after loading the view.
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
            print("added")
            
        }
        else
        {
            print("not")
        }
        

        
    }

    @IBAction func setremainderAction(sender: AnyObject) {
    }
    @IBAction func applyButtonAction(sender: AnyObject) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
