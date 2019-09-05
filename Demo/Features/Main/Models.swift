import Foundation

enum VC {
    enum GetVenues {
        struct Request {
            
        }
        
        struct Response {
            var venues: [Venue]
        }
        
        struct ViewModel {
            struct DisplayVenue {
                var icon: String
                var name: String
                var address: String
                
            }
            
            var displayVenues: [DisplayVenue]
        }
    }
}
