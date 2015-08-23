import Foundation
import Alamofire

public typealias Route = (method: Alamofire.Method, path: String)
public var manager: Alamofire.Manager? = nil

// TODO: add to own file
private extension String {
  private func z_stringByURLEncoding
    () -> String {
    return CFURLCreateStringByAddingPercentEscapes(
      nil,
      self,
      nil,
      "!*'();:@&=+$,/?%#[]",CFStringBuiltInEncodings.UTF8.rawValue
      ) as String
  }
}

public class API {
  public class func baseUrlString() -> String {
    return ""
  }
  
  public class func endpoint() -> String? {
    return nil
  }
  
  public class func buildPath(components: [AnyObject?]? = nil, usesEndpoint: Bool = true) -> String{
    var path: String = baseUrlString()
    if usesEndpoint {
      if let endpoint = endpoint() {
        path += "/\(endpoint.z_stringByURLEncoding())"
      }
    }
    
    if let components = components {
      for component in components {
        if let component = component as? String{
          path += "/" + "\(component.z_stringByURLEncoding())"
        } else if let intComponent = component as? Int {
          path += "/" + "\(intComponent)".z_stringByURLEncoding()
        }
      }
    }
    
    return path
  }
}

public extension Alamofire.Manager {
  public func request(route: Route, parameters: [String : AnyObject]? = nil) -> Request {
    return self.request(route.method, route.path, parameters: parameters, encoding: .URL)
  }
}