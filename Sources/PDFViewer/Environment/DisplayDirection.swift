//
//  DisplayDirection.swift
//  PDFViewer
//
//  Created by Daniel Behar on 12/3/25.
//

import SwiftUI
import PDFKit

extension EnvironmentValues {
    @Entry
    var pdfDisplayDirection: PDFDisplayDirection = .horizontal
}

extension View {
    public func pdfDisplayDirection(_ direction: PDFDisplayDirection) -> some View {
        environment(\.pdfDisplayDirection, direction)
    }
}
