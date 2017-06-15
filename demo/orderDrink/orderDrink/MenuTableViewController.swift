//
//  MenuTableViewController.swift
//  orderDrink
//
//  Created by 王君傑 on 2017/6/3.
//  Copyright © 2017年 王君傑. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var menu = [0:["name":"", "price":""]]
    var source = ""
    var source_name = ""
    var store_name = ""
    var store_phone = ""
    var index = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = source_name
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menu.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as! drinkTableViewCell

        // Configure the cell...
        let dic = menu[indexPath.row]
        cell.drinkNameLabel.text = dic?["name"]!
        cell.drinkPriceLabel.text = "$"+String((dic?["price"])!)!
        cell.addDrinkBtn.accessibilityValue = String(indexPath.row)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    /*
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let controller = segue.destination as! AddTableViewController
        let btn = sender as! UIButton
        let i = Int(btn.accessibilityValue!)!
        controller.menu = menu
        controller.source = source
        controller.source_name = source_name 
        
        controller.store_name = store_name 
        controller.store_phone = store_phone
        controller.drinkName = (self.menu[i]?["name"])!
        controller.drinkPrice = (self.menu[i]?["price"])!

    }
    
    

}
