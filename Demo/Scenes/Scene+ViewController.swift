import Foundation
import UIKit

extension Scene {
    func viewController() -> UIViewController {
        let SBMain = UIStoryboard(name: "Main", bundle: nil)
        
        switch self {
        case .datailPage:
            let vc = SBMain.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
            return vc
        }
    }
}
