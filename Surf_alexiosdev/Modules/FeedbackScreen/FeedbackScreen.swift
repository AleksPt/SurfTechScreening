import SwiftUI

struct FeedbackScreen: View {
    @Environment(\.dismiss) var dismiss
    @Binding var rating: Int
    @State private var textFeedback = ""
    @State private var textAdvantages = ""
    let product: ProductModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Spacer()
                    Text(Constants.SystemTexts.feedbackAboutProduct)
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                }
                .overlay(alignment: .topTrailing) {
                    Button {
                        rating = 0
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.black)
                    }
                    .offset(y: 5)
                }
                .padding()
                
                Text(Constants.SystemTexts.forProduct)
                    .bold()
                    .foregroundStyle(.gray)
                
                FeedbackCardView(product: product)
                
                Text(Constants.SystemTexts.feedbakWarning)
                    .font(.system(size: 15))
                    .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.15))
                .clipShape(.rect(cornerRadius: 5))
                .padding(.vertical)
                
                Text(Constants.SystemTexts.allEstimated)
                    .font(.system(size: 20)).bold()
                    .padding(.bottom, 5)
                
                HStack {
                    StarRatingView(
                        rating: $rating,
                        product: product,
                        size: 30,
                        shouldShowSheet: false
                    )
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("\(rating) из 5")
                            .font(.system(size: 20)).bold()
                        Text(estimatedProduct(value: rating))
                            .font(.system(size: 14))
                            .foregroundStyle(.gray)
                    }
                }
                .padding(.bottom)
                
                TextEditorView(
                    text: $textFeedback,
                    placeholder: Constants.SystemTexts.feedbackAboutProduct + " *"
                )
                .padding(.bottom)
                
                TextEditorView(
                    text: $textAdvantages,
                    placeholder: Constants.SystemTexts.advantages
                )
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
    
    private func estimatedProduct(value: Int) -> String {
        switch value {
        case 5:
            return Constants.SystemTexts.perfectEstimate
        case 4:
            return Constants.SystemTexts.goodEstimate
        case 0...3:
            return Constants.SystemTexts.badEstimate
        default:
            return ""
        }
    }
    
}

#Preview {
    let product = ProductModel(
        image: Constants.ImageProduct.image10,
        title: Constants.TitleProduct.title10
    )
    
    FeedbackScreen(rating: Binding.constant(4), product: product)
}
