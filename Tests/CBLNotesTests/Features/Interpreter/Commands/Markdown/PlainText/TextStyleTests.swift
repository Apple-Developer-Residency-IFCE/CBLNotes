import XCTest
@testable import CBLNotes

final class TextStyleTests: XCTestCase {
    func testDelimitersWhenIsNormalShouldReturnCorrectTuple() {
        let capturedValue = TextStyle.normal.delimiters
        let expectedValue = ("", "")
        XCTAssertEqual(capturedValue.0, expectedValue.0)
        XCTAssertEqual(capturedValue.1, expectedValue.1)
    }

    func testDelimitersWhenIsBoldShouldReturnCorrectTuple() {
        let capturedValue = TextStyle.bold.delimiters
        let expectedValue = ("@", "@")
        XCTAssertEqual(capturedValue.0, expectedValue.0)
        XCTAssertEqual(capturedValue.1, expectedValue.1)
    }
    
    func testDelimitersWhenIsItalicShouldReturnCorrectTuple() {
        let capturedValue = TextStyle.italic.delimiters
        let expectedValue = ("*", "*")
        XCTAssertEqual(capturedValue.0, expectedValue.0)
        XCTAssertEqual(capturedValue.1, expectedValue.1)
    }
    
    func testDelimitersWhenIsUnderlineShouldReturnCorrectTuple() {
        let capturedValue = TextStyle.underline.delimiters
        let expectedValue = ("_", "_")
        XCTAssertEqual(capturedValue.0, expectedValue.0)
        XCTAssertEqual(capturedValue.1, expectedValue.1)
    }
    
    func testDelimitersWhenIsStrikethroughShouldReturnCorrectTuple() {
        let capturedValue = TextStyle.strikethrough.delimiters
        let expectedValue = ("-", "-")
        XCTAssertEqual(capturedValue.0, expectedValue.0)
        XCTAssertEqual(capturedValue.1, expectedValue.1)
    }

    func testDelimitersWhenIsCodeShouldReturnCorrectTuple() {
        let capturedValue = TextStyle.code.delimiters
        let expectedValue = ("`", "`")
        XCTAssertEqual(capturedValue.0, expectedValue.0)
        XCTAssertEqual(capturedValue.1, expectedValue.1)
    }
}
