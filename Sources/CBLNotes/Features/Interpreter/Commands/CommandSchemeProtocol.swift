import SwiftUI
/// Protocolo `CommandScheme` define a estrutura necessária para representar um comando.
///
/// ```swift
///  // Exemplo para um comando "#" que renderiza um Text
/// class MyCommand: CommandScheme {
///     static var prefix: String = "#"
///
///     static func render(_ line: String) -> some View {
///         Text(line)
///             .font(.system(size: 38,
///                           weight: .bold,
///                           design: .default))
///     }
/// }
/// ```
public protocol CommandScheme: AnyObject, Hashable, Equatable {
    associatedtype Output: View

    /// Representa a string que será usada para identificar o comando.
    static var prefix: String { get }

    /// Método que renderiza a view associada ao comando.
    /// - Parameter line: String associada ao comando.
    /// - Returns: Retorna um View associado ao commando.
    @ViewBuilder static func render(_ line: String) -> Output
}

extension CommandScheme {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue.description)
    }
}
