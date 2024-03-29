import ArgumentParser

struct StartServer: ParsableCommand {
    static let configuration = CommandConfiguration(commandName: "start-server")

    @OptionGroup(visibility: .hidden)
    var globalOptions: GlobalOptions

    func run() throws {}
}
