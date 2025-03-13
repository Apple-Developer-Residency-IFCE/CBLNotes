import XCTest
import SwiftUI

@testable import CBLNotes

final class CBLNoteViewModelTests: XCTestCase {
    func testInterpretShouldCallInterpreterCorrectly() {
        let interpreterSpy = NoteInterpreterSpy()
        let sut = CBLNoteViewModel(text: .constant("teste"),
                                   shouldRender: .constant(true),
                                   interpreter: interpreterSpy)
        
        _ = sut.interpret()
        
        XCTAssertEqual(interpreterSpy.interpretArgs, ["teste"])
    }
}
