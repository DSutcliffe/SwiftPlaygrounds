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

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studios")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")

var allAlbums1: [Album] = [taylorSwift, fearless, iTunesLive]
var allAlbums2: [Album] = [taylorSwift, fearless]

//for album in allAlbums1 {
//    print(album.getPerformance())
//}

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
