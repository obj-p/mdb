import CompanionServer
import OpenAPIVapor
import Vapor

public extension Application {
    static func companionServiceApp() throws -> Application {
        let environment = Environment(
            name: "development",
            // Only pass the path through to Vapor's environment. This avoids passing mdb's arguments through.
            arguments: [ProcessInfo.processInfo.arguments[0]]
        )

        let app = Application(environment)
        let transport = VaporTransport(routesBuilder: app)
        let handler = CompanionServiceImpl()
        try handler.registerHandlers(on: transport, serverURL: CompanionServer.Servers.server1())
        return app
    }
}
