import XCTest
import SwiftUI

@testable import CBLNotes

class NoteInterpreterSpy: NoteInterpreterType {
    private(set) var registerCommandArgs = [any CommandScheme.Type]()
    func register(command: any CommandScheme.Type) {
        registerCommandArgs.append(command)
    }

    private(set) var registerCommandsArgs = [[any CommandScheme.Type]]()
    func register(commands: [any CommandScheme.Type]) {
        registerCommandsArgs.append(commands)
    }
    
    private(set) var unregisterArgs = [String]()
    func unregister(_ prefix: String) {
        unregisterArgs.append(prefix)
    }

    private(set) var unregisterPrefixesArgs = [[String]]()
    func unregister(prefixes: [String]) {
        unregisterPrefixesArgs.append(prefixes)
    }

    private(set) var interpretArgs = [String]()
    func interpret(_ input: String) -> some View {
        interpretArgs.append(input)
        return EmptyView()
    }
}

