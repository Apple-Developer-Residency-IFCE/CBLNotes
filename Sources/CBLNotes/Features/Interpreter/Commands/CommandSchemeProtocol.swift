import SwiftUI
/// Protocolo `CommandScheme` define a estrutura necessária para representar um comando.
///
/// ```swift
///  // Exemplo para um comando "#" que renderiza um Text
/// class MyCommand: CommandScheme {
///     static var prefix: String = "#"
///
///     @available(macOS 10.15, *)
///     static func render(_ line: String) -> some View {
///         Text(line)
///             .font(.system(size: 38,
///                           weight: .bold,
///                           design: .default))
///     }
/// }
/// ```
///
/// - Note: A versão mínima necessária para utilizar o método `render` é macOS 10.15.
public protocol CommandScheme: AnyObject, Hashable, Equatable {
    @available(macOS 10.15, *)
    associatedtype Output: View

    /// Representa a string que será usada para identificar o comando.
    static var prefix: String { get }

    /// Método que renderiza a view associada ao comando.
    /// - Parameter line: String associada ao comando.
    /// - Returns: Retorna um View associado ao commando.
    @available(macOS 10.15, *)
    @ViewBuilder static func render(_ line: String) -> Output
}

extension CommandScheme {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue.description)
    }
}
