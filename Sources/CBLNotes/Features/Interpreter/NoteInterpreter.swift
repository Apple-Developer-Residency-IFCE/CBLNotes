import SwiftUI
/// Implementação concreta e default para um `NoteInterpreterType`
@Observable
public class NoteInterpreter {
    @ObservationIgnored private var subscribedCommands:  [String: any CommandScheme.Type] = [:]

    init() {
        setupDefaultCommands()
    }

    private func setupDefaultCommands() {
        register(command: H1.self)
        register(command: H2.self)
        register(command: H3.self)
        register(command: H4.self)
        register(command: H5.self)
        register(command: H6.self)
        register(command: List.self)
        register(command: PlainText.self)
    }

    private func interpretLine(_ input: String) -> AnyView {
        let mdExpression = MarkdownExpression(input: input)
        let (command, associatedValue) = mdExpression.interpret()

        if let command = self.subscribedCommands[command] {
            return AnyView(command.render(associatedValue))
        } else {
            return AnyView(PlainTextHelperView(text: input))
        }
    }
}

extension NoteInterpreter: NoteInterpreterType {
    public func register(command: any CommandScheme.Type) {
        self.subscribedCommands[command.prefix] = command
    }

    public func unregister(_ prefix: String) {
        self.subscribedCommands[prefix] = nil
    }

    public func interpret(_ input: String) -> some View {
        let lines = input.components(separatedBy: "\n").enumerated().map { ($0, String($1)) }

        return ScrollView {
            ForEach(lines, id: \.0) { _, line in
                self.interpretLine(line)
            }
            .padding(20)
        }
    }
}
