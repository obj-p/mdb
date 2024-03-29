import XCTest

@testable import mdb

final class MDBTests: XCTestCase {
    func testHelp() throws {
        // When - invoking the ParsableArguments helpMessage()
        let helpMessage = MDB.helpMessage()
        let expectedHelpMessage = """
        USAGE: mdb [--port <port>] <subcommand>

        OPTIONS:
          -p, --port <port>       The MDB server port.
          -h, --help              Show help information.

        SUBCOMMANDS:
          start-server

          See 'mdb help <subcommand>' for detailed help.
        """

        // Then
        XCTAssertEqual(expectedHelpMessage, helpMessage)
    }
}
