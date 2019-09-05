import Foundation

protocol BusinessLogic {
    func getVenues()
}

protocol DataStore {
    var venues: [Venue]? { get }
}

class Interactor: BusinessLogic, DataStore {
    var presenter: PresentationLogic?
    var worker = Worker()
    var venues: [Venue]?
    
    // MARK: - BusinessLogic
    func getVenues() {
        worker.getVenues(success: { venues in
            self.venues = venues
            let response = VC.GetVenues.Response(venues: venues)
            self.presenter?.presentGetVenuesSuccess(response: response)
        }, fail: {
            self.presenter?.presentGetVenuesFail()
        })
        
    }
}
