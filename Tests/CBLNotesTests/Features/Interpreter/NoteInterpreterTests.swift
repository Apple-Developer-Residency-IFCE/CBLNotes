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

    func testRegisterCommandShouldSaveCommandAtSubscribedCommands() {
        let sut = NoteInterpreter()
        
        sut.register(command: CommandDummyOne.self)

        let capturedValue: [String: any CommandScheme.Type]? = Mirror.extract("subscribedCommands",
                                                                              from: sut)

        XCTAssertNotNil(capturedValue?["dummy1"])
    }

    func testRegisterCommandsShouldSaveCommandAtSubscribedCommands() {
        let sut = NoteInterpreter()
        
        sut.register(commands: [
            CommandDummyOne.self,
            CommandDummyTwo.self
        ])

        let capturedValue: [String: any CommandScheme.Type]? = Mirror.extract("subscribedCommands",
                                                                              from: sut)

        XCTAssertNotNil(capturedValue?["dummy1"])
        XCTAssertNotNil(capturedValue?["dummy2"])
    }
    
    
    func testUnregisterCommandShouldRemoveCommandAtSubscribedCommands() {
        let sut = NoteInterpreter()
        
        sut.register(command: CommandDummyOne.self)
        sut.unregister("dummy1")

        let capturedValue: [String: any CommandScheme.Type]? = Mirror.extract("subscribedCommands",
                                                                              from: sut)

        XCTAssertNil(capturedValue?["dummy1"])
    }
    
    
    func testUnregisterCommandsShouldRemoveCommandAtSubscribedCommands() {
        let sut = NoteInterpreter()
        
        sut.register(commands: [
            CommandDummyOne.self,
            CommandDummyTwo.self
        ])

        sut.unregister(prefixes: ["dummy1", "dummy2"])

        let capturedValue: [String: any CommandScheme.Type]? = Mirror.extract("subscribedCommands",
                                                                              from: sut)

        XCTAssertNil(capturedValue?["dummy1"])
        XCTAssertNil(capturedValue?["dummy2"])
    }
}

class CommandDummyOne: CommandScheme, Equatable {
    static let prefix: String = "dummy1"

    static func render(_ line: String = "") -> some View {
        return EmptyView()
    }

    static func == (lhs: CommandDummyOne, rhs: CommandDummyOne) -> Bool {
        lhs.hashValue.description == rhs.hashValue.description
    }
}

class CommandDummyTwo: CommandScheme, Equatable {
    static let prefix: String = "dummy2"

    static func render(_ line: String = "") -> some View {
        return EmptyView()
    }

    static func == (lhs: CommandDummyTwo, rhs: CommandDummyTwo) -> Bool {
        lhs.hashValue.description == rhs.hashValue.description
    }
}
