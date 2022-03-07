import UIKit

extension MainViewController
{
    override func tableView(_ tableView: UITableView,
                            canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath)
    {
        if editingStyle != .delete { return }
        
        var item = Item()
        if indexPath.section == 0 {
            item = activeItems[indexPath.row]
            activeItems.remove(at: indexPath.row)
        }
        else {
            item = doneItems[indexPath.row]
            doneItems.remove(at: indexPath.row)
        }
        
        for i in 0..<AppData.items.count {
            let itemInAppData = AppData.items[i]
            if (itemInAppData.name == item.name) {
                AppData.items.remove(at: i)
                break
            }
        }
        
        tableView.deleteRows(at: [indexPath],
                             with: UITableView.RowAnimation.left)
        
        
//        AppData.items.remove(at: indexPath.row)
//        tableView.deleteRows(at: [indexPath],
//                             with: UITableView.RowAnimation.left)
    }
    
    
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath)
    {
        var item = Item()
        if indexPath.section == 0
        {
            item = activeItems[indexPath.row]
            item.status = true
            
            activeItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath],
                                 with: UITableView.RowAnimation.left)
            
            doneItems.append(item)
            let newIndexPath = IndexPath(row: doneItems.count - 1,
                                         section: 1)
            tableView.insertRows(at: [newIndexPath],
                                 with: UITableView.RowAnimation.right)
        }
        else
        {
            item = doneItems[indexPath.row]
            item.status = false
            
            doneItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath],
                                 with: UITableView.RowAnimation.left)
            
            activeItems.append(item)
            let newIndexPath = IndexPath(row: activeItems.count - 1,
                                         section: 0)
            tableView.insertRows(at: [newIndexPath],
                                 with: UITableView.RowAnimation.right)
        }
        
        for i in 0..<AppData.items.count
        {
            let itemInAppData = AppData.items[i]
            if (itemInAppData.name == item.name)
            {
                AppData.items[i] = item
            }
        }
        
 
//        var thisItem = AppData.items[indexPath.row]
//        thisItem.status = !thisItem.status
//        AppData.items[indexPath.row] = thisItem
//        tableView.reloadData()
    }
}
