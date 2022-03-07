import UIKit

extension MainViewController
{
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    }
    
    override func tableView(_ tableView: UITableView,
                            titleForHeaderInSection section: Int) -> String?
    {
        if section == 0
        {
            return "Active Items"
        }
        else
        {
            return "Done Items"
        }
    }
    
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int
    {
        // return AppData.items.count
        if section == 0
        {
            return activeItems.count
        }
        else
        {
            return doneItems.count
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCellId",
                                                 for: indexPath)
        
        // let thisItem = AppData.items[indexPath.row]
        var thisItem = Item ()
        
        if indexPath.section == 0
        {
            thisItem = activeItems[indexPath.row]
        }
        else
        {
            thisItem = doneItems[indexPath.row]
        }
        
        
        
        let attrString = NSMutableAttributedString (string: thisItem.name)
        
        if thisItem.status
        {
            attrString.addAttribute(.strikethroughStyle,
                                    value: 2.0,
                                    range: NSMakeRange(0,
                                                       attrString.length))
            cell.backgroundColor = .lightGray
            cell.accessoryType = .checkmark
        }
        else
        {
            attrString.removeAttribute(NSAttributedString.Key.strikethroughStyle,
                                       range: NSMakeRange(0,
                                                          attrString.length))
            cell.backgroundColor = .white
            cell.accessoryType = UITableViewCell.AccessoryType.none
        }

        cell.textLabel?.attributedText = attrString
        
        return cell
    }
}
