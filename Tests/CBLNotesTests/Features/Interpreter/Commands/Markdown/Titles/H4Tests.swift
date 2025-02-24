import XCTest
@testable import CBLNotes

final class H4Tests: XCTestCase {
    func testPrefixShouldReturnACorrectSymbol() {
        XCTAssertEqual(H4.prefix, "####")
    }
}
