import OpenAPIRuntime

public struct CompanionServiceImpl: APIProtocol {
    public init() {}

    public func getDevices(_: Operations.getDevices.Input) async throws -> Operations.getDevices.Output {
        .ok(.init(body: .json(.init(devices: []))))
    }
}
