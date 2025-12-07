//
//  MarkupMode.swift
//  PDFViewer
//
//  Created by Daniel Behar on 12/6/25.
//

import SwiftUI

extension EnvironmentValues {
    @Entry
    var isInMarkupMode: Bool = false
}

extension View {
    public func isInMarkupMode(_ isInMarkupMode: Bool) -> some View {
        environment(\.isInMarkupMode, isInMarkupMode)
    }
}
