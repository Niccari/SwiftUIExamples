//
//  CommentRow.swift
//  Shared
//
//  Created by niccari on 2021/07/11.
//

import SwiftUI

struct CommentRow: View {
    let comment: Comment
    
    init(comment: Comment) {
        self.comment = comment
    }

    var body: some View {
        HStack {
            UserImage(viewModel: .init(url: comment.user.iconUrl))
                .padding(.top, 8)
                .padding(.bottom, 8)
                .padding(.trailing, 4)
                .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack {
                HStack {
                    Text(comment.user.name)
                        .bold()
                        .font(.footnote)
                    
                    Spacer()

                    Text(DateDatastore.shared.format(from: comment.date))
                        .font(.caption2)
                }

                Text(comment.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.callout)
            }
        }
    }
}

struct CommentRow_Previews: PreviewProvider {
    static var previews: some View {
        CommentRow(comment: Comment(
            user: User(
                id: "123",
                name: "Zuru",
                iconUrl: "https://homepages.cae.wisc.edu/~ece533/images/airplane.png"
            ),
            date: Date.init(timeIntervalSinceNow: 0),
            text: "bar foo piyo, lorem ipsum. \n A quick blown fox \n jumped over the lazy dog."
        ))
    }
}
