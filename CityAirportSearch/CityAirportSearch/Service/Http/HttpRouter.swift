
import Alamofire
import UIKit
import SwiftUI

protocol HttpRouter {
    
    var baseUrlString: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    func body() throws -> Data?
    
    func request(usingHttpService service: HttpService) throws -> DataRequest
}

extension HttpRouter {
    
    var parameters: Parameters? { return nil }
    var headers: HTTPHeaders? { return nil }
    func body() throws -> Data? { return nil }
    
    func asUrlRequest() throws -> URLRequest {
        
        var url = try baseUrlString.asURL()
        url.appendPathComponent(path)
        
        var reqest = try URLRequest(url: url, method: method, headers: headers)
        reqest.httpBody = try body()
        
        return reqest
    }
    
    func request(usingHttpService service: HttpService) throws -> DataRequest {
        
        return try service.request(asUrlRequest())
    }
}
