//
//  DepositViewController.swift
//  MidtermStarterF18
//
//  Created by parrot on 2018-11-14.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import CoreData

class DepositViewController: UIViewController {

    var context:NSManagedObjectContext!
    
    // MARK: Outlets
    // ---------------------
    @IBOutlet weak var customerIdTextBox: UITextField!
    @IBOutlet weak var balanceLabel: UILabel!

    @IBOutlet weak var depositAmountTextBox: UITextField!
    @IBOutlet weak var messagesLabel: UILabel!
    
    @IBAction func backtocustbutton(_ sender: Any) {
        performSegue(withIdentifier: "checktoadd", sender: self)
    }
    
    
    // MARK: Default Functions
    // ---------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        print("You are on the Check Balance screen!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    // MARK: Actions
    // ---------------------
    
    
    @IBAction func checkBalancePressed(_ sender: Any) {
        print("check balance button pressed!")
        // This is the same as:  SELECT * FROM User
        let fetchRequest:NSFetchRequest<Customers> = Customers.fetchRequest()
        
        do {
            // Send the "SELECT *" to the database
            //  results = variable that stores any "rows" that come back from the db
            // Note: The database will send back an array of User objects
            // (this is why I explicilty cast results as [User]
            let results = try fetchRequest.execute() as [Customers]
            
            // Loop through the database results and output each "row" to the screen
            print("Number of items in database: \(results.count)")
            
            for c in results {
                print("Person Email: \(c.name)")
                print("Person Password: \(c.balance)")
            }
        }
        catch {
            print("Error when fetching from database")
        }
    }
    
    
    @IBAction func depositButtonPressed(_ sender: Any) {
        print("you pressed the deposit button!")
    }
    
    
    @IBAction func showCustomersPressed(_ sender: Any) {
        print("Show customers button pressed!")
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
