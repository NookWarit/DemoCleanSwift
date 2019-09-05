import Foundation

protocol DataPassing {
    var dataStore: DataStore? { get }
}

class Router: DataPassing {
    // MARK: - Variable
    weak var viewControler : ViewController?
    var dataStore: DataStore?
    
    // MARK: - Navigation
    func routetoDetail(index: Int) {
        if let venue = dataStore?.venues?[index] {
            let vc = Scene.datailPage.viewController() as! DetailViewController
            vc.icon = venue.catIcon
            vc.name = venue.name
            vc.address = venue.location
            viewControler?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
