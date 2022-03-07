import Foundation

class AppData
{
    static var items: Array<Item>!
    
    class func populate ()
    {
        let item_1 = Item(name: "Bread",
                          status: false)
        let item_2 = Item(name: "Milk",
                          status: true)
        
        let item_3 = Item(name: "Potato",
                          status: true)
        let item_4 = Item(name: "Call Mom",
                          status: true)
        
        let item_5 = Item(name: "Pay Electric Bill",
                          status: false)
        let item_6 = Item(name: "Wash the Car",
                          status: true)
        
        
        items = [item_1, item_2, item_3, item_4, item_5, item_6]
    }
}
