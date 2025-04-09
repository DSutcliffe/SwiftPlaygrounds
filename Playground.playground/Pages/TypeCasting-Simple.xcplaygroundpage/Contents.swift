/// ************************************************************************************************************************************
/// 01: https://www.hackingwithswift.com/sixty/10/10/typecasting
/// ************************************************************************************************************************************
class Animal { }
class Fish: Animal { }      // Inherits from Animal Class

class Dog: Animal {         // Inherits from Animal Class
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]                   // Array of Animal - Type Inference
//let pets: [Animal] = [Fish(), Dog(), Fish(), Dog()]       // Array of Animal - Type specified

for pet in pets {
    if let dog = pet as? Dog {      // if type is Dog, run code - if nil, continue to end of loop
        dog.makeNoise()
    }
}
/// ************************************************************************************************************************************


/// ************************************************************************************************************************************
/// 02: https://www.hackingwithswift.com/read/0/20/polymorphism-and-typecasting
/// ************************************************************************************************************************************
class Album {
    var name: String

    init(name: String) {
        self.name = name
    }

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
var allAlbums1: [Album] = [taylorSwift, fearless, iTunesLive]
/// Create an array that holds only Albums. 2 x StudioAlbums
var allAlbums2: [Album] = [taylorSwift, fearless]

/// Further Demonstration
/// Uses the override version getPerformance depending on the subclass in question
/// Object can work as its class and its parent class at the same time
print("\n")
for album in allAlbums1 {
    /// Here we know allAlbums holds the type Album yet really it contains StudioAlbums and a Live Album, swift doesn't know that
    /// If we tried to print(album.studio) Swift will refuse to build, Only StudioAlbums objects have that property, and it thinks we have regular Albums
    /// To get over this we require Typecasting
    print(album.getPerformance())
}

/// Typecasting
print("\n")
for album in allAlbums1 {
    /// Swift will make studioAlbum have data type optional StudioAlbum
    /// The conversion might work, if not, you have nil
    /// Use if let...
    let studioAlbum = album as? StudioAlbum
    print(studioAlbum)
}

/// Here we can pull out parameters from within the subclass
print("\n")
for album in allAlbums1 {
    print(album.getPerformance())

    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.studio)
    } else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location)
    }
}

print("\n")
for album in allAlbums2 {
    let studioAlbum = album as! StudioAlbum     // Forced Downcast
    print(studioAlbum.studio)
}

print("\n")
for album in allAlbums2 as! [StudioAlbum] {     // Forced Downcast
    print(album.studio)
}

print("\n")
// Try to convert allAlbums1 to be an array of LiveAlbum objects, if that fails just create an empty array of LiveAlbums.
for album in allAlbums1 as? [LiveAlbum] ?? [LiveAlbum]() {
    // Wont print anything as allAlbums1 is not an array of LiveAlbum, it is mixed StudioAlbum & LiveAlbum
    print(album.location)
}
/// ************************************************************************************************************************************
