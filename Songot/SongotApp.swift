//
//  SongotApp.swift
//  Songot
//
//  Created by 이종우 on 2022/08/09.
//

import SwiftUI

@main
struct SongotApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: SongotDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
