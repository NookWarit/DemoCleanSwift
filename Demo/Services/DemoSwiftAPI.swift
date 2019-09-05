import Foundation
import Alamofire
import SwiftyJSON

class DemoSwiftAPI {
    // Mark: - Foursqure
    func getVenueExplore(completed: @escaping (_ response: JSON) -> Void) {
        Alamofire.request("https://api.foursquare.com/v2/venues/explore?near=NYC&oauth_token=D1LRRCXBCXHHWWLQ4O41QA0NJSMSMYOR5IJLMT4IUV3HCKDZ&v=20180815",
                          method: .get)
            .responseJSON(completionHandler: { response in
                completed(JSON(response.value ?? [:]))
        })
    }
}
