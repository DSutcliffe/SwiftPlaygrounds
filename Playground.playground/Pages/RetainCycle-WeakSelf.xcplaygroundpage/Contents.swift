// https://www.avanderlee.com/swift/weak-self/
import UIKit

// *******************************************
/// [A] RETAIN CYCLE - weak var
// *******************************************

/// In the following code example, we’re defining two instances as optionals following by setting them to nil. Although some of you might expect two print statements, this doesn’t actually happen:

class Blog {
    let name: String
    let url: URL
    var owner: Blogger?         // [v1]
//    weak var owner: Blogger?    // [v2]

    init(name: String, url: URL) { self.name = name; self.url = url }

    deinit {
        print("[A] Blog \(name) is being deinitialized")
    }
}

class Blogger {
    let name: String
    var blog: Blog?         // OR we could make this "weak" for [v2]

    init(name: String) { self.name = name }

    deinit {
        print("[A] Blogger \(name) is being deinitialized")
    }
}

var blog: Blog? = Blog(name: "SwiftLee", url: URL(string: "www.avanderlee.com")!)
var blogger: Blogger? = Blogger(name: "Antoine van der Lee")

blog!.owner = blogger
blogger!.blog = blog

blog = nil
blogger = nil

/// [v1] - Nothing is printed!, This is the result of a retain cycle:
/// The blog has a strong reference to its owner and is not willing to release. At the same time, the owner is not willing to free up its blog. The blog does not release its owner who is retaining its blog which is retaining himself which… well, you get the point, it’s an infinite loop: a retain cycle.

/// [v2] - Both "deinit's" are printed to the console!:
/// Only one weak reference is needed as this would already break the loop. For example, we could set a weak reference from the blog to its owner

// *******************************************
/// [B] RETAIN CYCLE - weak self, when not to use
// *******************************************

/// For many of us, it’s best practice to always use weak combined with self inside closures to avoid retain cycles. However, this is only needed if self also retains the closure. By adding weak by default you probably end up working with optionals in a lot of cases while it’s actually not needed.
/// Say that we introduce a publish method for our blog posts. Note that in this example, we’re “faking” a network request by adding a delay manually.

struct Post {
    let title: String
    var isPublished: Bool = false

    init(title: String) { self.title = title }
}

class Blog2 {
    let name: String
    let url: URL
    weak var owner: Blogger2?

    var publishedPosts: [Post] = []

    init(name: String, url: URL) { self.name = name; self.url = url }

    deinit {
        print("[B] Blog \(name) is being deinitialized")
    }

    func publish(post: Post) {
        /// Faking a network request with this delay:
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {                       // }
//            self.publishedPosts.append(post)                                        // } [v1]
//            print("[B] Published post count is now: \(self.publishedPosts.count)")  // }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in        // }
            self?.publishedPosts.append(post)                                       // } [v2]
            print("[B] Published post count is now: \(self?.publishedPosts.count)") // }
        }
    }
}

class Blogger2 {
    let name: String
    var blog2: Blog2?

    init(name: String) { self.name = name }

    deinit {
        print("[B] Blogger \(name) is being deinitialized")
    }
}

var blog2: Blog2? = Blog2(name: "SwiftLee", url: URL(string: "www.avanderlee.com")!)
var blogger2: Blogger2? = Blogger2(name: "Antoine van der Lee")

blog2!.owner = blogger2
blogger2!.blog2 = blog2

blog2!.publish(post: Post(title: "Explaining weak and unowned self"))
blog2 = nil
blogger2 = nil

/// [v1] - You can see that the request is completed before the blog has been released. The strong reference allowed us to finish publishing and to save the post to our published posts.
/// A retain cycle occurs as soon as a closure is retaining self and self is retaining the closure.

/// [v2] - When we change the publish method to include a weak reference instead, the blog has been released before the publishing request has been finished, we will never be able to update our local state of published posts. Therefore, make sure to not use weak self if there’s work to be done with the referencing instance as soon as the closure gets executed.

// *******************************************
/// [C] RETAIN CYCLE - weak self
// *******************************************

/// Having a variable containing an onPublish closure instead:

class Blog3 {
    let name: String
    let url: URL
    weak var owner: Blogger3?

    var publishedPosts: [Post] = []
    var onPublish: ((_ post: Post) -> Void)?

    init(name: String, url: URL) {
        self.name = name
        self.url = url

        // Adding a closure instead to handle published posts
//        onPublish = { post in                                                       // }
//            self.publishedPosts.append(post)                                        // } [v1]
//            print("[C] Published post count is now: \(self.publishedPosts.count)")  // }
        onPublish = { [weak self] post in                                            // }
            self?.publishedPosts.append(post)                                        // } [v2]
            print("[C] Published post count is now: \(self?.publishedPosts.count)")  // }
        }
    }

    deinit {
        print("[C] Blog \(name) is being deinitialized")
    }

    func publish(post: Post) {
        /// Faking a network request with this delay:
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.onPublish?(post)
        }
    }
}

class Blogger3 {
    let name: String
    var blog3: Blog3?

    init(name: String) { self.name = name }

    deinit {
        print("[C] Blogger \(name) is being deinitialized")
    }
}

var blog3: Blog3? = Blog3(name: "SwiftLee", url: URL(string: "www.avanderlee.com")!)
var blogger3: Blogger3? = Blogger3(name: "Antoine van der Lee")

blog3!.owner = blogger3
blogger3!.blog3 = blog3

blog3!.publish(post: Post(title: "Explaining weak and unowned self"))
blog3 = nil
blogger3 = nil

/// [v1] -  The closure is retaining the blog while the blog is retaining the closure. Although everything seems fine with the count of 1, we don’t see the blog and publisher being de-initialized. This is because of the retain cycle and results in memory not being freed up.

/// [v2] - Adding a weak reference to our blog instance inside the onPublish method solves our retain cycle. The data is saved locally and all instances are released. No more retain cycles!
