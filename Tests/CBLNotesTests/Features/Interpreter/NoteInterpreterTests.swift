import XCTest
import SwiftUI

@testable import CBLNotes

final class NoteInterpreterTests: XCTestCase {
    func testInitShouldRegisterDefaultCommands() {
        let expectedDefaultCommands = [
            H1.prefix,
            H2.prefix,
            H3.prefix,
            H4.prefix,
            H5.prefix,
            H6.prefix,
            List.prefix,
            PlainText.prefix
        ]

        let sut = NoteInterpreter()
        let capturedValue: [String: any CommandScheme.Type]? = Mirror.extract("subscribedCommands",
                                                                              from: sut)

        expectedDefaultCommands.forEach { command in
            XCTAssertNotNil(capturedValue?[command])
        }
    }

    func testRegisterShouldSaveCommandAtSubscribedCommands() {
        let sut = NoteInterpreter()
        
        sut.register(command: CommandDummy.self)

        let capturedValue: [String: any CommandScheme.Type]? = Mirror.extract("subscribedCommands",
                                                                              from: sut)

        XCTAssertNotNil(capturedValue?["dummy"])
    }
    
    
    func testUnregisterShouldRemoveCommandAtSubscribedCommands() {
        let sut = NoteInterpreter()
        
        sut.register(command: CommandDummy.self)
        sut.unregister("dummy")

        let capturedValue: [String: any CommandScheme.Type]? = Mirror.extract("subscribedCommands",
                                                                              from: sut)

        XCTAssertNil(capturedValue?["dummy"])
    }
}

class CommandDummy: CommandScheme {
    static let prefix: String = "dummy"

    static func render(_ line: String = "") -> some View {
        return EmptyView()
    }
}

extension CommandDummy {
    static func == (lhs: CommandDummy, rhs: CommandDummy) -> Bool {
        lhs.hashValue.description == rhs.hashValue.description
    }
}
