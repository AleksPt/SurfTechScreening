//
//  FeedbackCardView.swift
//  Surf_alexiosdev
//
//  Created by Алексей on 19.12.2024.
//

import SwiftUI

struct FeedbackCardView: View {
    let product: ProductModel
    
    var body: some View {
        HStack {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                Text(product.article.dropLast(20))
                    .foregroundStyle(.gray)
                    .font(.system(size: 12, weight: .bold))
                Spacer()
                Text(product.title)
                    .font(.system(size: 15))
            }
        }
        .frame(height: 75)
    }
}

#Preview {
    let product = ProductModel(
        image: Constants.ImageProduct.image10,
        title: Constants.TitleProduct.title10
    )
    
    FeedbackCardView(product: product)
}
