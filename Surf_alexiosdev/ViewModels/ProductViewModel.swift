import Foundation

@Observable
final class ProductViewModel {
    var products: [ProductModel] {
        getProgucts().shuffled()
    }
    
    private func getProgucts() -> [ProductModel] {
        [
            ProductModel(image: Constants.ImageProduct.image1, title: Constants.TitleProduct.title1),
            ProductModel(image: Constants.ImageProduct.image2, title: Constants.TitleProduct.title2),
            ProductModel(image: Constants.ImageProduct.image3, title: Constants.TitleProduct.title3),
            ProductModel(image: Constants.ImageProduct.image4, title: Constants.TitleProduct.title4),
            ProductModel(image: Constants.ImageProduct.image5, title: Constants.TitleProduct.title5),
            ProductModel(image: Constants.ImageProduct.image6, title: Constants.TitleProduct.title6),
            ProductModel(image: Constants.ImageProduct.image7, title: Constants.TitleProduct.title7),
            ProductModel(image: Constants.ImageProduct.image8, title: Constants.TitleProduct.title8),
            ProductModel(image: Constants.ImageProduct.image9, title: Constants.TitleProduct.title9),
            ProductModel(image: Constants.ImageProduct.image10, title: Constants.TitleProduct.title10)
        ]
    }
}
