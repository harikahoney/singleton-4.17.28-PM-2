

import UIKit

class DataTransfer: NSObject
{
    
    static var data:DataTransfer = DataTransfer()
    
    var name:String?
    var age:Int?
    var email:String?
    var mobileNum:String?
    var qualification:String?
    var yearOfPass:String?
    var percentage:Float?
    
    
    private override init()
    {
        super.init()
    }
    
    
    
}
