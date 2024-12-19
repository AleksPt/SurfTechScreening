import SwiftUI

struct CardView: View {
    @State private var rating = 0
    let product: ProductModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Image(product.image)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(.rect(cornerRadius: 8))
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .fill(.gray.opacity(0.5))
                    }
                Text(product.title)
                    .lineLimit(2)
                    .frame(width: 200)
                    .padding(.bottom, 8)
                
                StarRatingView(
                    rating: $rating,
                    product: product,
                    size: 20
                )
            }
            .padding()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
        
    }
}

#Preview {
    CardView(
        product: ProductModel(
            image: Constants.ImageProduct.image10,
            title: Constants.TitleProduct.title10
        )
    )
}
