import UIKit

class Model {
    static var shared = Model()
    private init() {}
    
    var items: [String] = ["a", "b", "c"]
}
