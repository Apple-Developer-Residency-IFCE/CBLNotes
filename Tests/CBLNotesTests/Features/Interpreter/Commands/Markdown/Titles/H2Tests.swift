import XCTest
@testable import CBLNotes

final class H2Tests: XCTestCase {
    func testPrefixShouldReturnACorrectSymbol() {
        XCTAssertEqual(H2.prefix, "##")
    }
}
