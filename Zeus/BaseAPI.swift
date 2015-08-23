import Zeus

public class BaseAPI : Zeus.API {
  public override class func baseUrlString() -> String {
    return "https://api.imgur.com/3"
  }
}
