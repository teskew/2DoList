//
//  ViewController.swift
//  2DoList
//
//  Created by student20 on 4/16/19.
//  Copyright © 2019 student20. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Uber", "Lift", "Gas"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
       cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    
    }
    // Table Delegate Methods
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       // print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType ==  .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none       } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New 2do Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default)  { (action ) in
        self.itemArray.append(textField.text!)
        self.tableView.reloadData()
            
            
            
       
    }
        alert.addTextField { (alertTextField) in
        alertTextField.placeholder  = "Creat New Item"
            
        textField = alertTextField
       
    }
         alert.addAction(action)
        present(alert, animated:true, completion: nil)
}
    
    
}


