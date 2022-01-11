
import Alamofire

class AirportHttpService: HttpService {
    
    var sessionManager: Session = Session.default
    
    func request(_ urlrequest: URLRequestConvertible) -> DataRequest {
        return sessionManager.request(urlrequest).validate(statusCode: 200..<400)
    }
    
}
