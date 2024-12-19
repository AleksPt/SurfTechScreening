import Foundation

struct ProductModel: Identifiable {
    let image: String
    let title: String
    let article = UUID().uuidString
    let id: UUID = UUID()
}
