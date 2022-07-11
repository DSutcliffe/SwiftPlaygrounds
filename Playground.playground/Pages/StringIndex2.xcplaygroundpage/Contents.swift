//var string1 = "200000000".getShortAppVersion()
//var string2 = "200001000".getShortAppVersion()
//var string3 = "200001001".getShortAppVersion()
//var string4 = "1200012012".getShortAppVersion()
var string5 = "10000099099".getShortAppVersion()

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }

    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }

    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }

    func getShortAppVersion() -> String {
        let patch = (Int(substring(from: count - 3)) ?? 0) % 100
        let minor = (Int(substring(with: count - 6..<count - 3)) ?? 0) % 100
        let major = (Int(substring(with: 0..<count - 6)) ?? 0) / 100
        return " \(major).\(minor).\(patch)"
    }
}
