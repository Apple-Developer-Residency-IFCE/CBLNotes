import SwiftUI
/// Protocolo `NoteInterpreterType` define uma Nota.
/// Utilizar implementação `Default NoteInterpreter`
public protocol NoteInterpreterType {
    associatedtype Output: View

    /// Método que realiza o registro de um novo comando. Os comandos são salvos em estrutura de tabela hash, dessa forma é importante que cada comando tenha o campo `prefix` único. Em casos de registro de mesmo `prefix`, apenas o último salvo será o ultilizado.
    /// - Parameter command: any CommandScheme.Type
    func register(command: any CommandScheme.Type)

    /// Método que realiza o registro de uma lista de novos comandos. Os comandos são salvos em estrutura de tabela hash, dessa forma é importante que cada comando tenha o campo `prefix` único. Em casos de registro de mesmo `prefix`, apenas o último salvo será o ultilizado.
    /// - Parameter commands: [any CommandScheme.Type]
    func register(commands: [any CommandScheme.Type])

    /// Método que remove um comando existe. Caso não exista, método não faz nada.
    /// - Parameter prefix: String
    func unregister(_ prefix: String)

    /// Método que remove uma lista de comandos existes. Caso não exista, método não faz nada.
    /// - Parameter prefixes: String
    func unregister(prefixes: [String])

    /// Método que interpreta um texto de entrada e retorna a view associada ao texto de entrada.
    /// - Parameter input: String associada ao comando.
    /// - Returns: Retorna as views associadas ao texto de entrada dentro de um `ScrollView`
    func interpret(_ input: String) -> Output
}
