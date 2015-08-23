import Zeus

public class GalleryAPI : BaseAPI {
  public override class func endpoint() -> String? {
    return "gallery"
  }
  
  public class func gallery(section: String = "hot", sort: String = "viral", window: String? = nil, page: Int? = nil) -> Zeus.Route {
    return (.GET, buildPath(components: [section, sort, window, page]))
  }
  
  public class func memes(sort: String? = nil, window: String? = nil, page: Int? = nil) -> Zeus.Route {
    return (.GET, buildPath(components: ["g", "memes", sort, page], usesEndpoint: false))
  }
  
  public class func memesImage(#id: Int) -> Zeus.Route {
    return (.GET, buildPath(components: ["g", "memes", id], usesEndpoint: false))
  }
  
  public class func subreddit(subreddit: String, sort: String? = nil, window: String? = nil, page: Int? = nil) -> Zeus.Route {
    return (.GET, buildPath(components: ["r", subreddit, sort, window, page]))
  }
  
  public class func subredditImage(#subreddit: String, id: String) -> Zeus.Route {
    return (.GET, buildPath(components: ["r", subreddit, id]))
  }
  
  public class func tag(tag: String, sort: String? = nil, window: String? = nil, page: Int? = nil) -> Zeus.Route {
    return (.GET, buildPath(components: ["t", tag, sort, window, page]))
  }
  
  public class func tagImage(#tag: String, id: String) -> Zeus.Route {
    return (.GET, buildPath(components: ["t", tag, id]))
  }
  
  public class func itemTags(#id: String) -> Zeus.Route {
    return (.GET, buildPath(components: [id, "tags"]))
  }
  
  public class func tagVoting(#id: String, tagName: String, vote: String) -> Zeus.Route {
    return (.GET, buildPath(components: [id, "vote", "tag", tagName, vote]))
  }
  
  public class func search(sort: String? = nil, window: String? = nil, page: Int? = nil) -> Zeus.Route {
    return (.GET, buildPath(components: ["search", sort, window, page]))
  }
  
  public class func random(page: Int? = nil) -> Zeus.Route {
    return (.GET, buildPath(components: ["random", "random", page]))
  }
  
  public class func publish(id: String) -> Zeus.Route {
    return (.POST, buildPath(components: [id]))
  }
  
  public class func remove(#id: String) -> Zeus.Route {
    return (.DELETE, buildPath(components: [id]))
  }
  
  public class func album(#id: String) -> Zeus.Route {
    return (.GET, buildPath(components: ["album", id]))
  }
  
  public class func image(#id: String) -> Zeus.Route {
    return (.GET, buildPath(components: ["image", id]))
  }
  
  public class func report(#id: String) -> Zeus.Route {
    return (.GET, buildPath(components: [id, "report"]))
  }
  
  public class func imageVotes(#id: String) -> Zeus.Route {
    return (.GET, buildPath(components: [id, "votes"]))
  }
  
  public class func imageVoting(#id: String, vote: String) -> Zeus.Route {
    return (.GET, buildPath(components: [id, "vote", vote]))
  }
  
  public class func imageComments(#id: String, sort: String? = nil) -> Zeus.Route {
    return (.GET, buildPath(components: [id, "comments", sort]))
  }
  
  public class func imageComment(#id: String) -> Zeus.Route {
    return (.GET, buildPath(components: [id, "comment"]))
  }
  
  public class func imageCommentCreation(#id: String) -> Zeus.Route {
    return (.POST, buildPath(components: [id, "comment"]))
  }
  
  public class func imageCommentReplyCreation(#id: String, commentID: String) -> Zeus.Route {
    return (.POST, buildPath(components: [id, "comment"]))
  }
  
  public class func imageCommentIDs(#id: String) -> Zeus.Route {
    return (.POST, buildPath(components: [id, "comments", "ids"]))
  }
  
  public class func imageCommentCount(#id: String) -> Zeus.Route {
    return (.POST, buildPath(components: [id, "comments", "count"]))
  }
}

