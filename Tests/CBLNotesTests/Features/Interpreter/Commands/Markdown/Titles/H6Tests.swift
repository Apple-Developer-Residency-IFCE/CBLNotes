import XCTest
@testable import CBLNotes

final class H6Tests: XCTestCase {
    func testPrefixShouldReturnACorrectSymbol() {
        XCTAssertEqual(H6.prefix, "######")
    }
}
