//
//  AddTableViewController.swift
//  orderDrink
//
//  Created by 王君傑 on 2017/6/5.
//  Copyright © 2017年 王君傑. All rights reserved.
//

import UIKit

class AddTableViewController: UITableViewController {
    
    
    var menu = [0:["name":"", "price":""]]
    var source = ""
    var source_name = ""
    var store_name = ""
    var store_phone = ""
    var drinkName = ""
    var drinkPrice = ""
    var keys = [String]()
    
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var yourNameText: UITextField!
    @IBOutlet weak var sweetSegment: UISegmentedControl!
    @IBOutlet weak var temperatureSegment: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.drinkNameLabel.text = self.drinkName
        
        
        
        let userDefault = UserDefaults.standard
        self.yourNameText.text = userDefault.string(forKey: "yourName")
        
        let controller = self.navigationController?.viewControllers[0] as! listTableViewController
        self.keys = controller.keys
        
    }
    
    @IBAction func addDone(_ sender: Any) {
        let userDefault = UserDefaults.standard
        userDefault.set(self.yourNameText.text!, forKey: "yourName")
        userDefault.synchronize()
        
        if self.yourNameText.text != "" {
            updDataToSheet()
        }  else {
            self.navigationController?.popToViewController((self.navigationController?.viewControllers[0])!, animated: true)
        }
        
    }
    
    func updDataToSheet() {
        var isFind = false
        if(self.keys.count>0) {
            for i in 0...self.keys.count-1 {
                if self.yourNameText.text == self.keys[i] {
                    isFind = true
                    break
                }
            }
        }
        
        var url = ""
        var method = ""
        if isFind {
            //update
            url = ("https://sheetsu.com/apis/v1.0/9c4ba7626fca/name/"+self.yourNameText.text!).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
            method = "PUT"
        } else {
            //insert
            url = "https://sheetsu.com/apis/v1.0/9c4ba7626fca"
            method = "POST"
        }
        
        
        
        let customer = [
            "name": self.yourNameText.text ?? "",
            "source": "迷克夏",
            "drink": self.drinkName,
            "price": self.drinkPrice,
            "sweet": self.sweetSegment.titleForSegment(at: self.sweetSegment.selectedSegmentIndex) ?? "正常",
            "temperature": self.temperatureSegment.titleForSegment(at: self.temperatureSegment.selectedSegmentIndex) ?? "正常",
            "size": "中杯"
            ] as [String: Any]
        
        var request = URLRequest(url: URL(string: url)!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = method
        request.httpBody = try! JSONSerialization.data(withJSONObject: customer, options: [])
        
        URLSession.shared.dataTask(with:request, completionHandler: {(data, response, error) in
            if error != nil {
                print(error ?? "error")
            } else {
                print ("update done")
                
                //let controller = self.navigationController?.viewControllers[0] as! listTableViewController
                
                //controller.isLoad = true
                //controller.getInfo()
                
                /*
                 do {
                 guard let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] else { return }
                 
                 guard let errors = json?["errors"] as? [[String: Any]] else { return }
                 if errors.count > 0 {
                 // show error
                 return
                 } else {
                 // show confirmation
                 }
                 }
                 */
            }
        }).resume()
        
        
        let controller = self.navigationController?.viewControllers[0] as! listTableViewController
        
        controller.tmpAdd = customer as! [String : String]
        controller.addDone()
        self.navigationController?.popToRootViewController(animated: true)
        //(self.navigationController?.viewControllers[0])!, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view data source
    /*
     override func numberOfSections(in tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 0
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     // #warning Incomplete implementation, return the number of rows
     return 0
     }
     */
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
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
