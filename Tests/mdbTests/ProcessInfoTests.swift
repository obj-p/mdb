import Darwin
import XCTest

@testable import mdb

final class ProcessInfoTests: XCTestCase {
    func testMDBServerPort() {
        // Given
        setenv("MDB_SERVER_PORT", "1337", 1)

        // When
        let port = ProcessInfo.processInfo.mdbServerPort

        // Then
        XCTAssertEqual(1337, port)
    }

    func testAnInvalidMDBServerPort() {
        // Given - an invalid port
        setenv("MDB_SERVER_PORT", "-1337", 1)

        // When
        let port = ProcessInfo.processInfo.mdbServerPort

        // Then
        XCTAssertNil(port)
    }
}
