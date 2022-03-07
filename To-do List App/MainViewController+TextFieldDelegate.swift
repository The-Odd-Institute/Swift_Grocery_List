import UIKit

extension MainViewController: UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        textField.placeholder = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        if let newName = textField.text
        {
            if newName == ""
            {
                textField.placeholder = "+New Ietm"
                return true
            }
            textField.text = ""
            textField.placeholder = "+New Ietm"
            
            
            
            for i in 0..<AppData.items.count
            {
                let item = AppData.items[i]
                if item.name.lowercased() == newName.lowercased()
                {
                    var refreshedItem = item
                    refreshedItem.status = false
                    self.tableView.reloadData()
                    return true
                }
            }
            
            
            
            
            let newItem = Item(name: newName, status: false)
            
            AppData.items.append(newItem)
            activeItems.append(newItem)
            
            self.tableView.beginUpdates()
            
            let newIndexPath = IndexPath(row: activeItems.count - 1,
                                         section: 0)
            
            self.tableView.insertRows(at: [newIndexPath],
                                      with: UITableView.RowAnimation.right)
            self.tableView.endUpdates()
            return true
        }
        else
        {
            return false
        }
    }
}
