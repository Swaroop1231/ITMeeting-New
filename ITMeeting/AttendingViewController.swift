//
//  ParticipatingCompaniesViewController.swift
//  ITMeeting
//
//  Created by test on 29/07/16.
//  Copyright © 2016 ITMeeting. All rights reserved.
//

import UIKit

class AttendingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    
    @IBOutlet weak var companyTable: UITableView!
    
    var companies = [FavouriteMeetingDetails]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let coredataObj = CoreDataHelper()
        
       // UINavigationBar.appearance().barTintColor = UIColor.brownColor()
        self.title = "Attending Meetings"
            //  UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        companies = coredataObj.fetchAttendingCompanyDetails()
        companyTable.reloadData()
        
        let logButton : UIBarButtonItem = UIBarButtonItem(title: "Signout", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(StudentViewController.logout))
        self.navigationItem.rightBarButtonItem = logButton
        
       

    }
    
    func logout()
    {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func whitecolor()->UIColor
    {
        
        return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return companies.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)-> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("company", forIndexPath: indexPath) as! CompanyTableViewCell
        
        
        cell.backView.layer.borderColor = whitecolor().CGColor
        cell.backView.layer.borderWidth = 1.0
        cell.backView.layer.cornerRadius = 5
        
        
        
        let  companyObj = companies[indexPath.row]
        
        
        cell.companyName.text = companyObj.name
        cell.locationLabel.text = companyObj.location
        cell.dateLabel.text = companyObj.date
        cell.timeLabel.text = companyObj.time
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
//        let indexPath = self.companyTable.indexPathForSelectedRow!
//        let detail = self.storyboard?.instantiateViewControllerWithIdentifier("CompanyDetailsViewController") as! CompanyDetailsViewController
//        detail.idStr = indexPath.row
//        self.navigationController?.pushViewController(detail, animated: true)
        
        
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning()
    {
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
