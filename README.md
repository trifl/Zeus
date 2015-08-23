# Zeus

To install, for now copy Zeus.swift into a project with the Alamofire framework.


## Example code

Here is an example of how we turn Imgur's [Subreddit Gallery](http://api.imgur.com/endpoints/gallery#subreddit) API into something usable with Zeus
```Swift
// GalleryAPI.swift

public class func subreddit(subreddit: String, sort: String? = nil, window: String? = nil, page: Int? = nil) -> Zeus.Route {
  return (.GET, buildPath(components: ["r", subreddit, sort, window, page]))
}
```
You can now easily connect to this API with Alamofire like this:
```Swift
// MyApplication.swift

let route = GalleryAPI.subreddit("pics", sort: "hot")
let request = myAlamoFireManager.request(route, parameters: parameters)
      // Envelope is a class that takes generics, handles the fact that Imgur wraps its responses in an envelope
      // Envelop<Imgur.Gallery?> tells the response object to automatically get parsed as a Gallery object!
      // These classes (will be) both included in the project as examples!
      .responseObject { (envelope: Envelope<Imgur.Gallery>?, error: NSError?) in
        if error == nil {
          if let gallery: Imgur.Gallery? = envelope?.data {
            // Do something with the gallery object
          }
        } else {
          // Handle error
        }
        completionHandler?(self, error)
    }
    // Remember, with Alamofire you can chain response handlers
    .responseJSON { request, response, JSON, error in
      // Do something with the raw JSON
    }

```
More to come!
  
