//
//  ViewController.swift
//  asdasds
//
//  Created by Tejas Jadhav on 2018-11-15.
//  Copyright © 2018 Tejas Jadhav. All rights reserved.
//

import UIKit
import CoreData

class AddCustomerViewController: UIViewController {
    
    // MARK: Outlets
    // ---------------------
    @IBOutlet weak var nameTextBox: UITextField!
    @IBOutlet weak var startingBalanceTextBox: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    // MARK: CoreDta variables
    // ------------------------------
    var context:NSManagedObjectContext!
    
    // MARK: Default Functions
    // ---------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    @IBAction func createAccountPressed(_ sender: Any) {
        // Code to create a random 4 digit string
        var x:String = ""
        repeat {
            // Create a string with a random number 0...9991
            x = String(format:"%04d", arc4random_uniform(9992) )
        } while x.count < 4
        
        print("Random value: \(x)")
        
        
        let u = Customer(context: self.context)
        u.customerid = x;
        u.name = nameTextBox.text!;
        u.balance = Double(startingBalanceTextBox.text!)!;
        
        
        do {
            try self.context.save()
            messageLabel.text = "Customer Created. Customer ID is \(x)";
        }
        catch {
            print("Error!")
        }
        
        
        print("you pressed the create account button!")
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
