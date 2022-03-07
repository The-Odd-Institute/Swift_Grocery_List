import UIKit

extension MainViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        AppData.populate ()
        
        separateItems ()
        
        self.tableView.tableHeaderView = headerView
        self.newItemTextField.delegate = self
        self.newItemTextField.autocapitalizationType = .words
    }
}
