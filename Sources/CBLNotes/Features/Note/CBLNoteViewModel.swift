import SwiftUI

struct CBLNoteViewModel {
    @Binding var text: String
    @Binding var shouldRender: Bool

    var interpreter: any NoteInterpreterType

    func interpret() -> some View {
        AnyView(interpreter.interpret(text))
    }
}
