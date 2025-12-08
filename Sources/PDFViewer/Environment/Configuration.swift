//
//  Configuration.swift
//  PDFViewer
//
//  Created by Daniel Behar on 12/3/25.
//

import SwiftUI
import PDFKit

public class PDFConfigBuilder {
    var autoScales: Bool?
    var backgroundColor: Color?
    var displaysAsBook: Bool?
    var displaysPageBreaks: Bool?
    var displaysRTL: Bool?
    var minScaleFactor: CGFloat?
    var maxScaleFactor: CGFloat?
    var pageBreakMargins: UIEdgeInsets?
    var pageShadowsEnabled: Bool?
    
    public static func builder() -> PDFConfigBuilder {
        PDFConfigBuilder()
    }

    fileprivate init() {
    }

    public func autoScales(_ autoScales: Bool) -> Self {
        self.autoScales = autoScales
        return self
    }
    
    public func backgroundColor(_ backgroundColor: Color) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    
    public func displaysAsBook(_ displaysAsBook: Bool) -> Self {
        self.displaysAsBook = displaysAsBook
        return self
    }
    
    public func displaysPageBreaks(_ displaysPageBreaks: Bool) -> Self {
        self.displaysPageBreaks = displaysPageBreaks
        return self
    }
    
    public func displaysRTL(_ displaysRTL: Bool) -> Self {
        self.displaysRTL = displaysRTL
        return self
    }
    
    public  func minScaleFactor(_ minScaleFactor: CGFloat) -> Self {
        self.minScaleFactor = minScaleFactor
        return self
    }
    
    public func maxScaleFactor(_ maxScaleFactor: CGFloat) -> Self {
        self.maxScaleFactor = maxScaleFactor
        return self
    }
    
    public func pageBreakMargins(_ pageBreakMargins: UIEdgeInsets) -> Self {
        self.pageBreakMargins = pageBreakMargins
        return self
    }
    
    public func pageShadowsEnabled(_ pageShadowsEnabled: Bool) -> Self {
        self.pageShadowsEnabled = pageShadowsEnabled
        return self
    }

    public func build() -> PDFConfiguration {
        return PDFConfiguration(autoScales: autoScales,
                                backgroundColor: backgroundColor,
                                displaysAsBook: displaysAsBook,
                                displaysPageBreaks: displaysPageBreaks,
                                displaysRTL: displaysRTL,
                                minScaleFactor: minScaleFactor,
                                maxScaleFactor: maxScaleFactor,
                                pageBreakMargins: pageBreakMargins,
                                pageShadowsEnabled: pageShadowsEnabled
        )
    }
}

public struct PDFConfiguration: Sendable  {
    public static let `default` = PDFConfiguration()
    
    public init(autoScales: Bool? = nil,
         backgroundColor: Color? = nil,
         displaysAsBook: Bool? = nil,
         displaysPageBreaks: Bool? = nil,
         displaysRTL: Bool? = nil,
         minScaleFactor: CGFloat? = nil,
         maxScaleFactor: CGFloat? = nil,
         pageBreakMargins: UIEdgeInsets? = nil,
         pageShadowsEnabled: Bool? = nil) {
        self.autoScales = autoScales
        self.backgroundColor = UIColor(backgroundColor ?? .white)
        self.displaysAsBook = displaysAsBook
        self.displaysPageBreaks = displaysPageBreaks
        self.displaysRTL = displaysRTL
        self.minScaleFactor = minScaleFactor
        self.maxScaleFactor = maxScaleFactor
        self.pageBreakMargins = pageBreakMargins
        self.pageShadowsEnabled = pageShadowsEnabled
    }
    
    
    var autoScales: Bool?
    var backgroundColor: UIColor?
    var displaysAsBook: Bool?
    var displaysPageBreaks: Bool?
    var displaysRTL: Bool?
    var minScaleFactor: CGFloat?
    var maxScaleFactor: CGFloat?
    var pageBreakMargins: UIEdgeInsets?
    var pageShadowsEnabled: Bool?
}

extension EnvironmentValues {
    @Entry
    var pdfConfiguration: PDFConfiguration = .default
}

extension View {
    public func pdfConfiguration(_ configuration: PDFConfiguration) -> some View {
        environment(\.pdfConfiguration, configuration)
    }
}
