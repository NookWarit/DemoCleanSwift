import Foundation
import SwiftyJSON

class Worker {
    // MARK: - Variable
    private let network = DemoSwiftAPI()
    
    // MARK: - Function
    func getVenues(success: @escaping (_ venues: [Venue]) -> Void,
                  fail: @escaping () -> Void) {
        network.getVenueExplore(completed: { response in
            if response["meta"]["code"].intValue == 200 {
                let group = response["response"]["groups"].arrayValue.first?.dictionaryValue
                let items = group?["items"]?.arrayValue
                let venues = items?.map({ Venue(response: $0["venue"]) }) ?? []
                success(venues)
            } else {
                fail()
            }
        })
    }
    
}
