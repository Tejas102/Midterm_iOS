//
//  AddCustomerViewController.swift
//  MidtermStarterF18
//
//  Created by parrot on 2018-11-14.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import CoreData

class AddCustomerViewController: UIViewController {

    // MARK: Outlets
    // ---------------------
    @IBOutlet weak var nameTextBox: UITextField!
    @IBOutlet weak var startingBalanceTextBox: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    var context:NSManagedObjectContext!
    
    @IBAction func gotocheckbutton(_ sender: Any) {
        performSegue(withIdentifier: "addtocheck", sender: self)
    }
    
    
    // MARK: Default Functions
    // ---------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        self.context = appDelegate.persistentContainer.viewContext
        
        // HINT HINT HINT HINT HINT
        // HINT HINT HINT HINT HINT
        // Code to create a random 4 digit string
        var x:String = "0..<9992"
        repeat {
            // Create a string with a random number 0...9991
            x = String(format:"%04d", arc4random_uniform(9992) )
        } while x.count < 4
        
        print("Random value: \(x)")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: Actions
    // ---------------------
    
    @IBAction func createAccountPressed(_ sender: Any) {
        print("you pressed the create account button!")
        let n = nameTextBox.text!
        let n2 = startingBalanceTextBox.text!
        
        let c = Customers(context: self.context)
        
        c.balance = 100
        c.name = n
        
        do {
            try self.context.save();
            print("Saved the person to the database!")
        }
        catch {
            print("Error when saving to the database")
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
