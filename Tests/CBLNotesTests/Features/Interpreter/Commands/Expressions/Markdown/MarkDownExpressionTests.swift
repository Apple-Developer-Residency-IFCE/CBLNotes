import XCTest
@testable import CBLNotes

final class MarkdownExpressionTests: XCTestCase {
    func testInterpretWhenSplitedInputCountIsLessThanOneShouldReturnADefaultValue() {
        let sut = MarkdownExpression(input: "")
        let capturedValue = sut.interpret()
        let expectedValue = ("", "")
        XCTAssertEqual(capturedValue.0, expectedValue.0)
        XCTAssertEqual(capturedValue.1, expectedValue.1)
    }

    func testInterpretWhenSplitedInputCountIsEqualOneShouldReturnADefaultValue() {
        let sut = MarkdownExpression(input: "a")
        let capturedValue = sut.interpret()
        let expectedValue = ("", "a")
        XCTAssertEqual(capturedValue.0, expectedValue.0)
        XCTAssertEqual(capturedValue.1, expectedValue.1)
    }
    
    func testInterpretWhenSplitedInputCountIsBiggerThanOneShouldReturnADefaultValue() {
        let sut = MarkdownExpression(input: "# teste")
        let capturedValue = sut.interpret()
        let expectedValue = ("#", "teste")
        XCTAssertEqual(capturedValue.0, expectedValue.0)
        XCTAssertEqual(capturedValue.1, expectedValue.1)
    }
}
