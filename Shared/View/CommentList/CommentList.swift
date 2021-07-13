//
//  ContentView.swift
//  Shared
//
//  Created by niccari on 2021/07/11.
//

import Foundation
import SwiftUI

struct CommentList: View {
    @State private var edittingComment = ""
    @State private var loginUser = User(
        id: "123",
        name: "Zuru",
        iconUrl: "https://homepages.cae.wisc.edu/~ece533/images/boat.png"
    )
    @State private var description = "blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah"
    @State private var comments = [
        Comment(
            user: User(
                id: "234",
                name: "Alice",
                iconUrl: "https://homepages.cae.wisc.edu/~ece533/images/airplane.png"
            ),
            date: Date.init(timeIntervalSinceNow: 0),
            text: "Could you tell your updated date?"
        ),
        Comment(
            user: User(
                id: "345",
                name: "Bob",
                iconUrl: "https://homepages.cae.wisc.edu/~ece533/images/peppers.png"
            ),
            date: Date.init(timeIntervalSinceNow: -200),
            text: "Yay! its nailed."
        ),
        Comment(
            user: User(
                id: "456",
                name: "Carroll",
                iconUrl: "https://homepages.cae.wisc.edu/~ece533/images/cat.png"
            ),
            date: Date.init(timeIntervalSinceNow: -400),
            text: "Meh,\nyou need to show evidences."
        ),
    ]
    
    private func removeComment(offsets: IndexSet) {
        comments.remove(atOffsets: offsets)
    }
    
    private func appendComment() {
        if (comments.count < 8) {
            comments.insert(Comment(
                user: loginUser,
                date: Date.init(timeIntervalSinceNow: 0),
                text: edittingComment
            ), at: 0)
            edittingComment = ""
        }
    }
    
    var body: some View {
        VStack {
            // Uses list to keep recycling comments area
            List{
                Section.init {
                    VStack {
                        ZStack {
                            HeroImage(viewModel: .init(url: "https://homepages.cae.wisc.edu/~ece533/images/fruits.png"))
                            VStack {
                                HStack {
                                    // Specifies style, to keep touch event available in List
                                    Button("Back") { }
                                        .buttonStyle(BorderlessButtonStyle())
                                    Spacer()
                                    Button("Share") { }
                                        .buttonStyle(BorderlessButtonStyle())
                                    Button("Menu") { }
                                        .buttonStyle(BorderlessButtonStyle())
                                }.padding()
                                Spacer()
                                Text("Some content title")
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .font(.title)
                                    .padding([.trailing, .bottom])
                            }
                        }
                        Text("Description")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .font(.title2)
                        Text(description)
                            .padding()
                        Text("Comments")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .font(.title2)
                    }
                }
                if (comments.count > 0) {
                    Section {
                        ForEach(comments, id: \.self) { comment in
                            CommentRow(comment: comment)
                        }
                        .onDelete(perform: removeComment)
                    }.toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                    }
                } else {
                    Section {
                        Text("No comments, its chance to first comment of you!")
                            .padding(.leading)
                    }
                }
            }

            HStack {
                UserImage(viewModel: .init(url: loginUser.iconUrl))
                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                TextField("put your comment", text: $edittingComment)
                    .frame(maxWidth: .infinity)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Post") {
                    appendComment()
                }.disabled(
                    edittingComment.count == 0
                        || edittingComment.count > 144)
            }.padding()
        }
    }
}

struct CommentList_Previews: PreviewProvider {
    static var previews: some View {
        CommentList()
    }
}
