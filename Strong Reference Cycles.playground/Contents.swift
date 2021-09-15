struct Container<T> {
    var array: [T] = [] {
        didSet {
            arrayDidChange?(array)
        }
    }

    var arrayDidChange: ((_ array: [T]) -> Void)?
}

class Whatever {
    var container: Container<String>

    init() {
        container = Container<String>()

//        container.arrayDidChange = { array in
        // To make print work, [unowned self] is required
        container.arrayDidChange = { [unowned self] array in
            self.f(s: array)
        }
    }

    deinit {
        print("deinit whatever")
    }

    func f(s: [String]) {
        print(s)
    }
}

var w: Whatever! = Whatever()
// ...
w = nil
