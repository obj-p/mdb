import XCTest

@testable import mdb

final class MDBTests: XCTestCase {
    func testHelp() throws {
        // Given - the ParsableArguments helpMessage()
        let helpMessage = MDB.helpMessage()
        let expectedHelpMessage = """
        USAGE: mdb [--port <port>]

        OPTIONS:
          -p, --port <port>       The MDB server port.
          -h, --help              Show help information.

        """

        // Then
        XCTAssertEqual(expectedHelpMessage, helpMessage)
    }

    func testPort() throws {
        // Given -
        var mdb = try MDB.parseAsRoot(["--port", "1337"])

        // When -
        try mdb.run()

        // Then -
    }
}
