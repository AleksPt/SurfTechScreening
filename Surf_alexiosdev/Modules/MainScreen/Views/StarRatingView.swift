import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Int
    @State private var showFeedbackScreen = false
    let product: ProductModel
    let maxRating = 5
    var offImage: Image?
    let onImage = Image(systemName: "star.fill")
    let offColor = Color.blue.opacity(0.3)
    let onColor = Color.blue
    let size: CGFloat
    let shouldShowSheet: Bool
    
    init(
        rating: Binding<Int>,
        product: ProductModel,
        size: CGFloat,
        shouldShowSheet: Bool = true
    ) {
        self._rating = rating
        self.product = product
        self.size = size
        self.shouldShowSheet = shouldShowSheet
    }
    
    var body: some View {
        HStack{
            ForEach(1..<maxRating + 1, id:\.self) { number in
                image(for: number)
                    .font(.system(size: size))
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                        if shouldShowSheet {
                            showFeedbackScreen = true
                        }
                    }
            }
            .sheet(
                isPresented: $showFeedbackScreen) {
                    rating = 0
                } content: {
                    FeedbackScreen(
                        rating: $rating,
                        product: product
                    )
                }
        }
    }
    
    private func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

#Preview {
    let product = ProductModel(
        image: Constants.ImageProduct.image10,
        title: Constants.TitleProduct.title10
    )
    
    StarRatingView(rating: Binding.constant(3), product: product, size: 20)
}
