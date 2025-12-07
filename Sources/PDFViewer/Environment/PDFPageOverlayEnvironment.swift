//
//  PDFPageOverlayEnvironment.swift
//  PDFViewer
//
//  Created by Daniel Behar on 12/6/25.
//

import SwiftUI
import PDFKit

public typealias PDFPageOverlayProvider = @MainActor (_ page: PDFPage) -> UIView?
public typealias PDFPageOverlayRelease = @MainActor (_ page: PDFPage) -> Void

extension EnvironmentValues {
    @Entry
    var pdfPageOverlayProvider: PDFPageOverlayProvider = { _ in nil }
}

extension View {
    public func overlayForPage(_ provider: @escaping PDFPageOverlayProvider) -> some View {
        environment(\.pdfPageOverlayProvider, provider)
    }
}

extension EnvironmentValues {
    @Entry
    var pdfPageOverlayRelease: PDFPageOverlayRelease = { _ in }
}

extension View {
    public func overlayWillFinishDisplayingForPage(_ release: @escaping PDFPageOverlayRelease) -> some View {
        environment(\.pdfPageOverlayRelease, release)
    }
}
