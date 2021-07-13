//
//  ContentView.swift
//  SwiftUIExamples (iOS)
//
//  Created by niccari on 2021/07/13.
//

import SwiftUI

struct MainView: View {
    let navigate: ((NavigatorStatus) -> Void)?

    init(navigate: ((NavigatorStatus) -> Void)? = nil) {
        self.navigate = navigate
    }

    var body: some View {
        VStack {

            Button("GoogleMapOverlay") {
            }.background(Color.yellow).padding()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
