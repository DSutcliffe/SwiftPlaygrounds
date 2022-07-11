struct Device {
    var type: String
    var price: Float
    var color: String
}

var myiMacPro = Device(type: "iMac Pro", price: 4999.00, color: "Space Grey")
var myiPhone6Plus = Device(type: "iPhone", price: 799.00, color: "White")
var myiPhone7 = Device(type: "iPhone", price: 699.00, color: "Black")
var myiPad = Device(type: "iPad", price: 599.00, color: "Space Grey")
var myAppleWatch = Device(type: "Apple Watch", price: 349.00, color: "Space Grey")
var myAppleTV = Device(type: "Apple TV", price: 199.00, color: "Black")

let myDevices = [myiMacPro, myiPhone6Plus, myiPhone7, myiPad, myAppleWatch, myAppleTV]

let appleGear1 = myDevices.filter({ $0.type == "iPhone" })
print(appleGear1)

let appleGear2 = myDevices.filter { anyName in
    anyName.color == "Space Grey"
}
print(appleGear2)


