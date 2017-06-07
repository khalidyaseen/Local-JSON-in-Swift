import UIKit

let url = Bundle.main.url(forResource: "data", withExtension: "json")
//print(url)
let data = NSData(contentsOf: url!)
//print(data)

func readJSONObject(object: [String: AnyObject]) -> Int{
    guard let title = object["dataTitle"] as? String,
        let version = object["swiftVersion"] as? Float,
        let users = object["users"] as? [[String: AnyObject]] else { return 221}
    _ = "Swift \(version) " + title
    for i in users{
        print((i["age"]!),"is the age of", (i["name"]!))
    }
    
    for user in users {
        guard let name = user["name"] as? String,
            let age = user["age"] as? Int else { break }
        switch age {
        case 22:
            _ = name + " is \(age) years old."
        case 25:
            _ = name + " is \(age) years old."
        case 29:
            _ = name + " is \(age) years old."
        default:
            break
        }
    }
return 10
}

func testfunc(ob: NSDictionary){
    print(ob["dataTitle"]!)
    print(ob["swiftVersion"]!)
    let usr = ob["users"] as! [[String: AnyObject]]
    let name = usr[0] as [String: AnyObject]
    print(usr[1])
    print(name["age"]!)
}

do {
    let object = try JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments) as? [String: AnyObject]
    
    let obj = try JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments) as? AnyObject    //print(object)
    
   // if let dictionary = object as? [String : AnyObject] {
        readJSONObject(object: object! )
        testfunc(ob: obj! as! NSDictionary)
        
       // let title = dictionary["dataTitle"] as? String
       // let
      // if let inside = dictionary[""] as! NSArray?{
//            print(inside)
//        }
    }
catch  {
    // Handle Error
}
