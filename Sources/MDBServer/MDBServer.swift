import CompanionServer
import OpenAPIVapor
import Vapor

public extension Application {
    static func companionServiceApp() throws -> Application {
        let environment = Environment(
            name: "development",
            arguments: [ProcessInfo.processInfo.arguments[0]]
        )
        let app = Application(environment)
        let transport = VaporTransport(routesBuilder: app)
        let handler = CompanionServiceImpl()
        try handler.registerHandlers(on: transport)
        return app
    }
}
