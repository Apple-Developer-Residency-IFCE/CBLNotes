import XCTest
@testable import CBLNotes

final class PlainTextTests: XCTestCase {
    func testPrefixShouldReturnACorrectSymbol() {
        XCTAssertEqual(PlainText.prefix, "")
    }
}
