//
//  DisplayMode.swift
//  PDFViewer
//
//  Created by Daniel Behar on 12/3/25.
//

import SwiftUI
import PDFKit

extension EnvironmentValues {
    @Entry
    var pdfDisplayMode: PDFDisplayMode = .singlePage
}

extension View {
    public func pdfDisplayMode(_ displayMode: PDFDisplayMode) -> some View {
        environment(\.pdfDisplayMode, displayMode)
    }
}
