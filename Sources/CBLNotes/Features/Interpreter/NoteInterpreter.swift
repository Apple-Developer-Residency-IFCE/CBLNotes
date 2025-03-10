import SwiftUI
/// Implementação concreta e default para um `NoteInterpreterType`
@Observable
public class NoteInterpreter {
    @ObservationIgnored private var subscribedCommands:  [String: any CommandScheme.Type] = [:]

    public init() {
        setupDefaultCommands()
    }

    private func setupDefaultCommands() {
        register(commands: [
            H1.self,
            H2.self,
            H3.self,
            H4.self,
            H5.self,
            H6.self,
            List.self,
            PlainText.self
        ])
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

    public func register(commands: [any CommandScheme.Type]) {
        commands.forEach { register(command: $0) }
    }

    public func unregister(_ prefix: String) {
        self.subscribedCommands[prefix] = nil
    }

    public func unregister(prefixes: [String]) {
        prefixes.forEach { unregister($0) }
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
