import XCTest
@testable import CBLNotes

final class H5Tests: XCTestCase {
    func testPrefixShouldReturnACorrectSymbol() {
        XCTAssertEqual(H5.prefix, "#####")
    }
}
