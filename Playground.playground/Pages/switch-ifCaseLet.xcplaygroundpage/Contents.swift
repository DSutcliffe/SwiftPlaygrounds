/// These 4 all do the same
/// 1
switch result {
  case .success(let data):
    completion(data)
}
/// 2
if case .success(let data) = result { ... }
/// 3
switch result {
  case let .success(data):
    completion(data)
}
/// 4
if case let .success(data) = result { ... }
