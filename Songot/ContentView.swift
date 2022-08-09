//
//  ContentView.swift
//  Songot
//
//  Created by 이종우 on 2022/08/09.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: SongotDocument

    var body: some View {
        Text($document.content.content.wrappedValue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(SongotDocument()))
    }
}
