
import Alamofire

protocol HttpService {
    
    var sessionManager: Session { get set }
    
    func request(_ urlrequest: URLRequestConvertible) -> DataRequest
}
