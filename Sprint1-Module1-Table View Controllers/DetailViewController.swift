import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var field: UITextField!
    
    var content: String = ""
    var indexPath: IndexPath = IndexPath(row: 0, section: 0)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        label.text = content
        field.text = content
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        guard let text = field.text else { return }
        if !text.isEmpty, text != content {
            Model.shared.items[indexPath.row] = text
        }
    }
    
}
