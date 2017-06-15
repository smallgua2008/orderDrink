//
//  ViewController.swift
//  orderDrink
//
//  Created by 王君傑 on 2017/6/3.
//  Copyright © 2017年 王君傑. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //var menu = [0:["name":"", "price":""]]
    //var store = [0:["name":"", "phone":""]]
    
    var drink = [
        "milkshop": [
            "name":"",
            "store_name":"",
            "store_phone":"",
            "menu":[0:["name":"", "price":""]]
        ]
    ]
    /*
     drink = array(
     //資料來源（品牌）
     source => array(
     //門市名稱
     "store_name":"",
     //門市電話
     "store_phone":"",
     //菜單
     "menu"=> array(
     array("name": 名稱, "price":價格）
     )
     )
     )
     */
    
    let sheetApiUrl = "https://sheetsu.com/apis/v1.0/9c4ba7626fca"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let arrSource = ["milkshop", "muzirichi"]
        
        let arrSourceName = ["迷克夏", "木子日青"]
        
        
        let arrStore = [
            ["name":"大安店", "phone": "02-27036116"],
            ["name":"大安店", "phone": "02-27063201"]
        ]
        
        let arrMenu = [
            "大正紅茶,25,英倫伯爵紅茶,30,茉香綠,25,初露青,30,高峰烏龍綠,25,決明大麥,25,青採翠玉(無糖限定),35,鹿谷黃金烏龍(無糖限定),60,小山迎露(無糖限定),65,紅茶拿鐵,50,綠茶拿鐵,50,烏龍茶拿鐵,50,青茶拿鐵,50,麥香拿鐵,50,伯爵紅茶拿鐵,50,珍珠紅茶拿鐵,55,布丁紅茶拿鐵,55,仙草凍紅茶拿鐵,55,紅豆紅茶拿鐵,55,珍珠鮮奶,75,冬瓜鮮奶,75,抹茶鮮奶,75,可可亞鮮奶,75,紅豆鮮奶,75,大甲芋頭鮮奶,75,手炒黑糖鮮奶,75,布丁鮮奶,70,仙草凍鮮奶,70,黃金憨吉鮮奶,75,草莓鮮奶(冰沙),75,原鄉冬瓜茶,25,蜂農花蜜茶,45,冬瓜青茶,40,百香綠茶,45,冰糖洛神梅(現熬）,40,養樂多綠,50,甘蔗青茶,45,香柚綠茶,50,青檸香茶,45,檸檬綠茶,45,冬瓜檸檬L,40,黑糖檸檬,50,金吉檸檬,45,冰萃檸檬,50,阿文翠梅綠,50,蔓莓雙果醋,55",
            "手作珍珠鮮奶茶(紅),65,手作珍珠鮮奶茶(綠),65,手作珍珠鮮奶茶(烏龍),65,手作珍珠抹茶拿鐵,65,手作仙草蜜鮮奶,60,手作珍珠烏龍奶,45,手作珍珠茉香綠,35,紅燕拿鐵,55,綠燕拿鐵,55,烏燕拿鐵,55,冬燕拿鐵,55,抹茶拿鐵,55,養樂多輕飲(綠),35,養樂多輕飲(紅),35,多酚輕飲(綠),35,多酚輕飲(紅),35,青檸多酚輕飲,45,鮮奶多酚輕飲,55,原味鮮豆奶,40,錫蘭紅鮮豆奶,55,茉香綠鮮豆奶,55,烏龍綠鮮豆奶,55,冬瓜鮮豆奶,55,蜜蜂採的,40,蜜蜂掉進紅茶,45,蜜蜂掉進綠茶,45,蜜蜂掉進烏龍綠,45,蜜蜂掉進奶茶,50,梅子醋冰茶,35,蘋果醋冰茶,35,巧克力可可,35,巧克力奶茶,40,鮮萃百香(綠),45,鮮萃百香(紅),45,鮮萃檸檬(綠),45,鮮萃檸檬(紅),45,鮮萃金桔檸檬汁,45,錫蘭紅茶,25,茉香綠茶,25,烏龍綠茶,25,坪林包種青茶,30,古法熬煮冬瓜露,25,手工熬煮仙草甘茶,30,錫蘭奶茶,35,茉香綠奶茶,35,烏龍綠奶茶,35,仙草冬瓜茶,35"
            
        ]
        
        for i in 0...(arrSource.count-1) {
            let s = arrSource[i]
            addSource(source: s, source_name: arrSourceName[i], store_name:arrStore[i]["name"]!, store_phone:arrStore[i]["phone"]!)
            addMenu(source: s, menu: arrMenu[i])
        }
        
    }
    
    func addSource(source:String, source_name:String, store_name:String, store_phone:String) {
        drink[source] = [
            "name": source_name,
            "store_name":store_name,
            "store_phone": store_phone,
            "menu":[0:["name":"", "price":""]]
        ]
    }
    
    func addMenu(source:String, menu: String) {
        let t = menu.components(separatedBy: ",")
        var arr = [0:["name":"","price":""]]
        var index = 0
        
        let cnt = t.count/2
        for i in 0...cnt-1 {
            index = i*2
            arr[i] = ["name":t[index],"price":t[index+1]]
        }
        drink[source]?["menu"] = arr
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let source = segue.identifier!
        
        if source == "segueList" {
            
            
        } else {
            let controller = segue.destination as! MenuTableViewController
            controller.menu = drink[source]!["menu"]! as! [Int : Dictionary<String, String>]
            controller.source = source
            controller.source_name = drink[source]!["name"]! as! String
            
            controller.store_name = drink[source]!["store_name"]! as! String
            controller.store_phone = drink[source]!["store_phone"]! as! String
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

