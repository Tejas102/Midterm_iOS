//
//  ViewController.swift
//  asdasds
//
//  Created by Tejas Jadhav on 2018-11-15.
//  Copyright © 2018 Tejas Jadhav. All rights reserved.
//

import UIKit
import CoreData

class DepositViewController: UIViewController {
    
    var person:Customer!;
    
    // MARK: Outlets
    // ---------------------
    @IBOutlet weak var customerIdTextBox: UITextField!
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet weak var depositAmountTextBox: UITextField!
    @IBOutlet weak var messagesLabel: UILabel!
    
    // MARK: CoreDta variables
    // ------------------------------
    var context:NSManagedObjectContext!
    
    // MARK: Default Functions
    // ---------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("You are on the Check Balance screen!")
        
        // Setup your CoreData variable
        // ----------------------------------------
        
        // 1. Mandatory - copy and paste this
        // Explanation: try to create/initalize the appDelegate variable.
        // If creation fails, then quit the app
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // 2. Mandatory - initialize the context variable
        // This variable gives you access to the CoreData functions
        self.context = appDelegate.persistentContainer.viewContext
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    // MARK: Actions
    // ---------------------
    
    
    @IBAction func checkBalancePressed(_ sender: Any) {
        print("check balance button pressed!")
        
        let fetchRequest:NSFetchRequest<Customer> = Customer.fetchRequest()
        
        //WHERE
        fetchRequest.predicate = NSPredicate(format: "customerId == %@", customerIdTextBox.text!);
        
        
        do {
            let results = try self.context.fetch(fetchRequest) as [Customer]
            
            // Loop through the database results and output each "row" to the screen
            print("Number of items in database: \(results.count)")
            
            if results.count == 1 {
                balanceLabel.text = "$\(results[0].balance)";
            }
        }
        catch {
            print("Error when fetching from database")
        }
    }
    
    
    @IBAction func depositButtonPressed(_ sender: Any) {
        print("you pressed the deposit button!")
        let fetchRequest:NSFetchRequest<Customer> = Customer.fetchRequest()
        
        //WHERE
        fetchRequest.predicate = NSPredicate(format: "customerId == %@", customerIdTextBox.text!);
        
        
        do {
            let results = try self.context.fetch(fetchRequest) as [Customer]
            
            // Loop through the database results and output each "row" to the screen
            print("Number of items in database: \(results.count)")
            
            if results.count == 1 {
                balanceLabel.text = "$\(results[0].balance)";
                person = results[0];
                person.balance = results[0].balance + Double(depositAmountTextBox.text!)!;
                balanceLabel.text = "$\(person.balance)";
                messagesLabel.text = "Deposit sucess";
                do {
                    print("saved to database")
                    try self.context.save()
                }
                catch {
                    print("Error while saving to database")
                }
            }
        }
        catch {
            print("Error when fetching from database")
        }
        
    }
    
    
    @IBAction func showCustomersPressed(_ sender: Any) {
        print("Show customers button pressed!")
        
        let fetchRequest:NSFetchRequest<Customer> = Customer.fetchRequest()
        
        do {
            
            let results = try self.context.fetch(fetchRequest) as [Customer]
            
            print("Number of items in database: \(results.count)")
            
            for x in results {
                print("Name: \(x.name!)")
                print("Customer ID: \(x.customerid!)")
                print("Balance: $\(x.balance)")
                print("--------------")
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
