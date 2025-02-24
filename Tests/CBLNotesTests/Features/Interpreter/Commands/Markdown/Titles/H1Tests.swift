import XCTest
@testable import CBLNotes

final class H1Tests: XCTestCase {
    func testPrefixShouldReturnACorrectSymbol() {
        XCTAssertEqual(H1.prefix, "#")
    }
}
