
import RxSwift
import Foundation
import Alamofire

class AirportService {
    
    private lazy var httpService = AirportHttpService()
    static let shared: AirportService = AirportService()
}


extension AirportService: AirportAPI {
    func fetchAirports() -> Single<AirportsResponse> {
        
        return Single<AirportsResponse>.create { [httpService] (single) -> Disposable in
              
        do {
            try AirportHttpRouter.getAirports
                .request(usingHttpService: httpService)
                .responseDecodable { (result) in
                    do {
                        let airports = try AirportService.shared.parseAirports(result: result)
                        single(.success(airports))
                    } catch {
                        single(.failure(error))
                    }
                }
        } catch {
            single(.failure(CustomError.error(message: "Airports fetch failed")))
        }
                              
        return Disposables.create()
        }
  }
}


extension AirportService {
    
    func parseAirports(result: AFDataResponse<Any>) throws -> AirportsResponse {
     
//        guard let data = result.data else { return }
        
        guard let stubUrl = Bundle(for: Self.self).url(forResource: "Airports", withExtension: "json") else {
            throw CustomError.error(message: "Invalid Airports JSON")
        }
        let stubData = try Data(contentsOf: stubUrl)
        let airports = try JSONDecoder().decode(AirportsResponse.self, from: stubData)
        return airports
    }
}
