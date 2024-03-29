import Foundation

extension ProcessInfo {
    ///  The mdb server port as defined by the environment variable `MDB_SERVER_PORT`.
    var mdbServerPort: UInt? {
        environment["MDB_SERVER_PORT"].flatMap(UInt.init(_:))
    }
}
