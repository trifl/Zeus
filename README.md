# Zeus

To install, for now just copy Zeus.swift into a project with the Alamofire framework.
This project will be updated to 1.0.0 once I finish up the model layer.

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
    // Remember, with Alamofire you can chain response handlers
    .responseJSON { request, response, JSON, error in
      // Do something with the raw JSON
    }
```

More to come!
