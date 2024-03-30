import ArgumentParser
import MDBServer
import Vapor

struct StartServer: AsyncParsableCommand {
    static let configuration = CommandConfiguration(commandName: "start-server")

    @OptionGroup(visibility: .hidden)
    var globalOptions: GlobalOptions

    func run() async throws {
        let app = try Application.companionServiceApp()
        try await app.execute()
    }
}
