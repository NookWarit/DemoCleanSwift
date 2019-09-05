import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView

protocol DisplayLogic : class {
    func displayGetVenuesSuccess(viewModel: VC.GetVenues.ViewModel)
    func displayGetVenuesFail()
}

class ViewController: UIViewController, NVActivityIndicatorViewable, DisplayLogic {
    //Mark: - IBOutlet
    @IBOutlet weak var tableView : UITableView!
    
    //Mark: -Variable
    let displayCell = "DisplayCell"
    var interactor: BusinessLogic?
    var router: Router?
    var displayVenues: [VC.GetVenues.ViewModel.DisplayVenue] = []
    
    
    //Mark: - Life Cycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configurator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configurator()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "DisplayCell", bundle: nil), forCellReuseIdentifier: displayCell)
        
        let size = CGSize(width: 42, height: 42)
        startAnimating(size, message: "",
                       type: .ballTrianglePath, fadeInAnimation: nil)
       interactor?.getVenues()
        
    }
    
    // MARK: - Function
    func configurator() {
        let interactor = Interactor()
        let presenter = Presenter()
        let router = Router()
        
        self.interactor = interactor
        self.router = router
        interactor.presenter = presenter
        presenter.viewController = self
        router.viewControler = self
        router.dataStore = interactor
    }
    
    // MARK: - Display Logic
    func displayGetVenuesSuccess(viewModel: VC.GetVenues.ViewModel) {
        stopAnimating()
        displayVenues = viewModel.displayVenues
        tableView.reloadData()
    }
    
    func displayGetVenuesFail() {
        stopAnimating()
        print("Fail")
    }


}
//Mark: - UITableViewDatasorce & Delegate
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayVenues.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: displayCell, for: indexPath) as! DisplayCell
        
        let data = displayVenues[indexPath.row]
        cell.configureCell(icon: data.icon, name: data.name, address: data.address)
        
        return cell
    }
    
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        router?.routetoDetail(index: indexPath.row)
    }
}



