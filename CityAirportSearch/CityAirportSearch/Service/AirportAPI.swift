
import RxSwift

protocol AirportAPI {
    func fetchAirports() -> Single<AirportsResponse> //only read the first response even if its an error. ie single
}
