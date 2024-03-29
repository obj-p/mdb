import XCTest

@testable import mdb

final class StartServerTests: XCTestCase {
    func testHelp() throws {
        // When - invoking the ParsableArguments helpMessage()
        let helpMessage = StartServer.helpMessage()
        let expectedHelpMessage = """
        USAGE: start-server

        OPTIONS:
          -h, --help              Show help information.

        """

        // Then
        XCTAssertEqual(expectedHelpMessage, helpMessage)
    }
}
