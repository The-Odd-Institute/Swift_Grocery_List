import Foundation

extension MainViewController
{
    func separateItems ()
    {
        for item in AppData.items
        {
            if item.status
            {
                doneItems.append(item)
            }
            else
            {
                activeItems.append(item)
            }
        }
    }
}
