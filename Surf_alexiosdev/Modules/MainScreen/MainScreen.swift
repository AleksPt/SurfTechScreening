import SwiftUI

struct MainScreen: View {
    private var viewModel = ProductViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Constants.SystemTexts.waitingFeedback)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.leading)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.products, id: \.id) { item in
                        CardView(product: item)
                    }
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.never)
        }
    }
}

#Preview {
    MainScreen()
}
