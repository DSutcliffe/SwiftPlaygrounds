import UIKit

class Album {
    var name: String

    init(name: String) {
        self.name = name
    }
    
    // Further Demonstration Code
    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String

    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    
    // Further Demonstration Code
    override func getPerformance() -> String {
        return "The studio album \(name) sold lots"
    }
}

class LiveAlbum: Album {
    var location: String

    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    
    // Further Demonstration Code
    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}

/// Because any instance of StudioAlbum or LiveAlbum are inherited from Album they can be treated as either album or StudioAlbum/LiveAlbum
/// it's both at the same time. This is "Polymorphism"
var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studios")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")

/// Create an array that holds only Albums. 2 are StudioAlbums and 1 is a LiveAlbum but fine as they are all descended from Album class never lose their original class
var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]


/// Further Demonstration
/// Uses the override version getPerformance depending on the subclass in question
/// Object can work as its class and its parent class at the same time
for album1 in allAlbums {
    /// Here we know allAlbums holds the type Album yet really it contains StudioAlbums and a Live Album, swift doesnt know that
    /// If we tried to print(album.studio) Swift will refuse to build, Only StudioAlbums objects have that property, and it thinks we have regular Albums
    /// To get over this we require Typecasting
    print(album1.getPerformance())
}

/// Typecasting 1
for album2 in allAlbums {
    /// Swift will make studioAlbum have data type optional StudioAlbum
    /// The conversion might work, if not, you have nil
    /// Use if let...
    let studioAlbum = album2 as? StudioAlbum
}

/// Typecasting 2
/// Here we can pull out paramters from within the subclass
for album3 in allAlbums {
    print(album3.getPerformance())
    
    if let studioAlbum = album3 as? StudioAlbum {
        print(studioAlbum.studio)
    } else if let liveAlbum = album3 as? LiveAlbum {
        print(liveAlbum.location)
    }
}
