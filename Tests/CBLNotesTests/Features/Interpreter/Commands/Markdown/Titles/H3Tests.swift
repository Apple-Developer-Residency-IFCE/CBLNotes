import XCTest
@testable import CBLNotes

final class H3Tests: XCTestCase {
    func testPrefixShouldReturnACorrectSymbol() {
        XCTAssertEqual(H3.prefix, "###")
    }
}
