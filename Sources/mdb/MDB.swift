import ArgumentParser
import Foundation

@main
struct MDB: AsyncParsableCommand {
    static let configuration = CommandConfiguration(subcommands: [StartServer.self])

    @OptionGroup()
    var globalOptions: GlobalOptions
}
