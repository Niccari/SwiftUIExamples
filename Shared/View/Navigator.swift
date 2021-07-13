//
//  Navigator.swift
//  SwiftUIExamples (iOS)
//
//  Created by niccari on 2021/07/13.
//

import SwiftUI

struct Navigator: View {
    @State private var navigator: NavigatorStatus = .Main

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: CommentList()) {
                    Text("CommentList")
                }.padding()
                NavigationLink(destination: GoogleMapOverlay()) {
                    Text("GoogleMapOverlay")
                }.padding()
            }
        }
    }
}

struct Navigator_Previews: PreviewProvider {
    static var previews: some View {
        Navigator()
    }
}
