import ArgumentParser
import Foundation

@main
struct MDB: ParsableCommand {
    @Option(name: .shortAndLong, help: "The MDB server port.")
    var port: UInt?

    mutating func run() throws {
        port = port ?? ProcessInfo.processInfo.mdbServerPort

        // setup dependencies and invoke subcommand
        print("Hello, world! On port \(String(describing: port)).")
    }
}
