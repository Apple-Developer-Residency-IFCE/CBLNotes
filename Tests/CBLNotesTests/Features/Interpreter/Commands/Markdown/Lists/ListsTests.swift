import XCTest
@testable import CBLNotes

final class ListTests: XCTestCase {
    func testPrefixShouldReturnACorrectSymbol() {
        XCTAssertEqual(List.prefix, "-")
    }
}
