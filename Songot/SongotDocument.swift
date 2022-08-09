//
//  SongotDocument.swift
//  Songot
//
//  Created by 이종우 on 2022/08/09.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static let songotDocument = UTType(exportedAs: "dev.jongwoo.songot")
}

struct SongotDocument: FileDocument {
    static var readableContentTypes: [UTType] { [.songotDocument] }
    var content: Songot

    init(text: String = "Hello, world!") {
        self.content = Songot(content: text)
    }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        content = try JSONDecoder().decode(Songot.self, from: data)
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = try JSONEncoder().encode(content)
        let fileWrapper = FileWrapper(regularFileWithContents: data)
        return fileWrapper
    }
}
