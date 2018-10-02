import UIKit

class TableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let reuseIdentifier = "cell"
    
    // var items = ["a", "b", "c"]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else {
            fatalError("unable to deque guaranteed cell")
        }
        
        cell.textLabel?.text = Model.shared.items[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailController = segue.destination as? DetailViewController else {
            fatalError("Segue to wrong kind of controller")
        }
        
        guard let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Unable to capture selected index path")
        }
        
        let content = Model.shared.items[indexPath.row]
        detailController.content = content
        detailController.indexPath = indexPath
        // detailController.label.text = content
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
}

