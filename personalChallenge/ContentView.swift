//
//  ContentView.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 09/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            VStack {
                QuestionScreen()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
