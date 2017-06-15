//: Playground - noun: a place where people can play

import UIKit



func addMenu(source:String, menu: String) {
    let t = menu.components(separatedBy: ",")
    var arr = [0:["name":"","price":""]]
    //var name = [Int:String]()
    ///var price = [Int:String]()
    var index = 0
    
    let cnt = t.count/2
    print("count\(t.count)")
    for i in 0...cnt-1 {
        index = i*2
        //name[i] = t[index]
        //price[i] = t[index+1]
        //print("index\(index) name=\(t[index]) price=\(t[index+1])")
        arr[i] = ["name":t[index],"price":t[index+1]]
    }
}

let milkshop = "大正紅茶,25,英倫伯爵紅茶,30,茉香綠,25,初露青,30,高峰烏龍綠,25,決明大麥,25,青採翠玉(無糖限定),35,鹿谷黃金烏龍(無糖限定),60,小山迎露(無糖限定),65,紅茶拿鐵,50,綠茶拿鐵,50,烏龍茶拿鐵,50,青茶拿鐵,50,麥香拿鐵,50,伯爵紅茶拿鐵,50,珍珠紅茶拿鐵,55,布丁紅茶拿鐵,55,仙草凍紅茶拿鐵,55,紅豆紅茶拿鐵,55,珍珠鮮奶,75,冬瓜鮮奶,75,抹茶鮮奶,75,可可亞鮮奶,75,紅豆鮮奶,75,大甲芋頭鮮奶,75,手炒黑糖鮮奶,75,布丁鮮奶,70,仙草凍鮮奶,70,黃金憨吉鮮奶,75,草莓鮮奶(冰沙),75,原鄉冬瓜茶,25,蜂農花蜜茶,45,冬瓜青茶,40,百香綠茶,45,冰糖洛神梅(現熬）,40,養樂多綠,50,甘蔗青茶,45,香柚綠茶,50,青檸香茶,45,檸檬綠茶,45,冬瓜檸檬L,40,黑糖檸檬,50,金吉檸檬,45,冰萃檸檬,50,阿文翠梅綠,50蔓莓雙果醋,55"
addMenu(source:"milkshop", menu: milkshop)



let arrSource = ["milkshop", "muzirichi"]
print(arrSource.count)

for i in 0...(arrSource.count) {
    print(arrSource[i])
}
