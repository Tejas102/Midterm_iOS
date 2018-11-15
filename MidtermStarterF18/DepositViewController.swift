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
        
        let fetchRequest:NSFetchRequest<Customers> = Customers.fetchRequest()
        
        do {
            let results = try fetchRequest.execute() as [Customers]
            
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
        
        let fetchRequest:NSFetchRequest<Customers> = Customers.fetchRequest()
        
        do {
            let results = try fetchRequest.execute() as [Customers]
            
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
