import Foundation

// Helper para conseguir validar atributos privados
extension Mirror {
    static func extract<T>(_ attribute: String, from object: Any) -> T? {
        let child = Mirror(reflecting: object).children.first { $0.label == attribute }
        return child?.value as? T
    }
}
