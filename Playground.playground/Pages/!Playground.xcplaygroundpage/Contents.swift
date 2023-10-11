// Retain Cycle - Memory Leak

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show RedController",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(handleShowRedController))
    }
    
    @objc func handleShowRedController() {
        navigationController?.pushViewController(RedController(), animated: true)
    }
}

class RedController: UITableViewController {
    
    /// Using "deinit" with a "print" will show us when the controller/class has been de-initialised/removed from memory
    deinit {
        print("OS Reclaiming memory for RedController")
    }
    
    // MARK: 1
    /// No links to other classes, therefore no STRONG or WEAK references
    
    // MARK: 2 & 3
    /// Adding a reference to another class CAN create a STRONG link (STRONG circular reference) between RedController & Service, depending on variable declaration
    let service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .red
        
        /// MARK: 1 & 3- Comment Out
        /// MARK: 2 - Un-Comment
        // MARK: 2 STRONG Reference
        service.redControllerStrong = self
        
        /// MARK: 1 & 2- Comment Out
        /// MARK: 3 - Un-Comment
        // MARK: 3 WEAK Reference
        service.redControllerWeak = self
    }
}

class Service {
    
    // MARK: 1
    /// Does not have reference to this class

    // MARK: 2 STRONG Reference
    var redControllerStrong: RedController?
    
    // MARK: 3 WEAK Reference
    weak var redControllerWeak: RedController?
}
