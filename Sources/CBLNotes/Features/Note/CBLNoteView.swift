import SwiftUI
/// Componente responsável por transformar um `text` em uma `View` a partir dos `commands` cadastrados em um `NoteInterpreterType`.
///
/// Por default é um `TextEditor` e pode, de acordo com o valor de `shouldRender`, renderizar uma `View` associada ao retorno de um `NoteInterpreterType`.
/// ```swift
///  // Exemplo de uso
/// struct ExampleView: View {
/// @State private var text: String = "# teste"
/// @State private var shouldRender: Bool = true
/// @State var interpreter: any NoteInterpreterType = NoteInterpreter()
///
///  var body: some View {
///      CBLNoteView(text: $text,
///      shouldRender: $shouldRender,
///      interpreter: interpreter)
///  }
/// }
/// ```
public struct CBLNoteView: View {
    private let viewModel: CBLNoteViewModel
    @FocusState private var isFocused: Bool

    /// Inicializador para rendeirização e edição.
    /// - Parameter text: Binding<String> para o texto associado.
    /// - Parameter shouldRender: Binding<Bool> controla o que vai ser renderizados. Caso seja `false`, irá apresentar um `TextEditor`, caso `true`, irá apresentar o resultado de `NoteInterpreterType.interpret(_ input: String)`.
    /// - Parameter interpreter: any NoteInterpreterType responsável pela interpretação do `text`.
    public init(text: Binding<String>,
                shouldRender: Binding<Bool>,
                interpreter: any NoteInterpreterType = NoteInterpreter()) {
        viewModel = CBLNoteViewModel(text: text,
                                     shouldRender: shouldRender,
                                     interpreter: interpreter)
    }

    /// Inicializador para rendeirização.
    /// - Parameter text: String a ser renderizada.
    /// - Parameter interpreter: any NoteInterpreterType responsável pela interpretação do `text`.
    public init(text: String,
                interpreter: any NoteInterpreterType = NoteInterpreter()) {
        viewModel = CBLNoteViewModel(text: .constant(text),
                                     shouldRender: .constant(true),
                                     interpreter: interpreter)
    }

    public var body: some View {
        ZStack {
            ZStack {
                if viewModel.shouldRender {
                    viewModel.interpret()
                        .onTapGesture {
                            isFocused = true
                        }
                }
                TextEditor(text: viewModel.$text)
                    .opacity(viewModel.shouldRender ? 0 : 1)
                    .focused($isFocused)
            }
        }
        .animation(.easeOut, value: viewModel.shouldRender)
    }
}
