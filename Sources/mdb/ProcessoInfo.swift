import Foundation

extension ProcessInfo {
    // TODO: docstring
    var mdbServerPort: UInt? {
        environment["MDB_SERVER_PORT"].flatMap(UInt.init(_:))
    }
}
