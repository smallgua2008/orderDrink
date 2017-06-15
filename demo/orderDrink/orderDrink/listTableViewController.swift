//
//  listTableViewController.swift
//  orderDrink
//
//  Created by 王君傑 on 2017/6/7.
//  Copyright © 2017年 王君傑. All rights reserved.
//

import UIKit

class listTableViewController: UITableViewController {
    
    var order = [0:["name":""]]
    var total = 0
    var tmpAdd = ["name":""]
    var keys = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //打電話。  url = URL(String: "tel://xxxx")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        getInfo()
    }
    
    func addDone() {
        var isFind = false
        for i in 0...order.count-1 {
            if order[i]?["name"] == tmpAdd["name"] {
                isFind = true
                order[i] = tmpAdd
            }
        }
        if(!isFind) {
            let j = order.count
            order[j] = order[j-1]
            order[j-1] = tmpAdd
            keys.append(tmpAdd["name"]!)
        }
        self.total = 0
        
        self.tableView.reloadData()
    }
    
    func getInfo() {
        
        print ("getinfo")
        
        let url = URL(string: "https://sheetsu.com/apis/v1.0/9c4ba7626fca")
        do {
            let html = try String(contentsOf: url!)
            
            let data = html.data(using: .utf8)!
            var dic = ["name":""]
            
            let json = try? JSONSerialization.jsonObject(with: data)
            if (json != nil) {
                var i = 0
                for p in json as! [[String:AnyObject]] {
                    dic = [
                        "name":(p["name"] as? String)!,
                        "source":(p["source"] as? String)!,
                        "drink":(p["drink"] as? String)!,
                        "price":(p["price"] as? String)!,
                        "sweet":(p["sweet"] as? String)!,
                        "temperature":(p["temperature"] as? String)!,
                        "size":(p["size"] as? String)!,
                    ]
                    
                    self.order[i] = dic
                    keys.append(p["name"]! as! String)
                    i+=1
                }
                
                if self.order.count > 0 {
                    self.order[i] = [
                        "name": "",
                        "source": "",
                        "drink": "",
                        "price": "0",
                        "sweet": "",
                        "temperature": "",
                        "size": "",
                    ]
                }
            }
            
            
        } catch {
            print (error)
        }
        
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
        return self.order.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! listTableViewCell

        // Configure the cell...
        
        var dic = self.order[indexPath.row]
        
        cell.nameLabel.text = dic?["name"]!
        cell.sourceLabel.text = dic?["source"]!
        cell.drinkLabel.text = dic?["drink"]!
        cell.temperatureLabel.text = dic?["temperature"]!
        cell.sweetLabel.text = dic?["sweet"]!
        cell.sizeLabel.text = dic?["size"]!


        if self.order.count - 1 == indexPath.row {
            cell.priceLabel.text = "$"+(String(self.total))
            cell.sumLabel.text = "總計："
            cell.telLabel.text = "電話：02-27036116"
        } else {
            cell.priceLabel.text = "$"+(dic?["price"]!)!
            cell.sumLabel.text = ""
            self.total = self.total + Int((dic?["price"])!)!
            cell.telLabel.text = ""
        }
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
