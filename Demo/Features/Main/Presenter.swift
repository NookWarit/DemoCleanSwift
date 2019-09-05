import Foundation

protocol PresentationLogic {
    func presentGetVenuesSuccess(response: VC.GetVenues.Response)
    func presentGetVenuesFail()
}

class Presenter: PresentationLogic {
    // MARK: - Variable
    weak var viewController: DisplayLogic?
    
    // MARK: - Presentation Logic
    func presentGetVenuesSuccess(response: VC.GetVenues.Response) {
        let displayVanues = response.venues.map({ venue -> VC.GetVenues.ViewModel.DisplayVenue in
            return VC.GetVenues.ViewModel.DisplayVenue(icon: venue.catIcon,
                                                       name: venue.name,
                                                       address: venue.location)
        })
        let viewModel = VC.GetVenues.ViewModel(displayVenues: displayVanues)
        viewController?.displayGetVenuesSuccess(viewModel: viewModel)
    }
    
    func presentGetVenuesFail() {
        viewController?.displayGetVenuesFail()
    }
    
}
