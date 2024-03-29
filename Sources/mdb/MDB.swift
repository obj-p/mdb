import ArgumentParser
import Foundation

@main
struct MDB: ParsableCommand {
    static let configuration = CommandConfiguration(subcommands: [StartServer.self])

    @OptionGroup()
    var globalOptions: GlobalOptions
}
