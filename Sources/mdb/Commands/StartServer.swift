import ArgumentParser

struct StartServer: ParsableCommand {
    static let configuration = CommandConfiguration(commandName: "start-server")

    func run() throws {
        print("foo")
    }
}
