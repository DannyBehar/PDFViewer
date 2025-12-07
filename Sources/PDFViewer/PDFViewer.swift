import SwiftUI
import PDFKit
import PencilKit

public struct PDFViewer: UIViewRepresentable {
    @Environment(\.pdfPageOverlayProvider) private var overlayProvider
    @Environment(\.pdfPageOverlayRelease) private var overlayRelease
    
    let document: PDFDocument
    
    public init(document: PDFDocument) {
        self.document = document
    }
    
    public func makeUIView(context: Context) -> PDFView {
        let displayMode = context.environment.pdfDisplayMode
        let displayDirection = context.environment.pdfDisplayDirection
        let isInMarkupMode = context.environment.isInMarkupMode
        let config = context.environment.pdfConfiguration
        
        let pdfView = PDFView()
        
        pdfView.displayMode = displayMode
        pdfView.displayDirection = displayDirection
        pdfView.isInMarkupMode = isInMarkupMode
        
        pdfView.pageOverlayViewProvider = context.coordinator
        pdfView.document = document
        
        if let autoScales = config.autoScales {
            pdfView.autoScales = autoScales
        }
        
        if let backgroundColor = config.backgroundColor {
            pdfView.backgroundColor = backgroundColor
        }
        
        if let displayAsBook = config.displaysAsBook {
            pdfView.displaysAsBook = displayAsBook
        }
        
        if let displaysPageBreaks = config.displaysPageBreaks {
            pdfView.displaysPageBreaks = displaysPageBreaks
        }
        
        if let displaysRTL = config.displaysRTL {
            pdfView.displaysRTL = displaysRTL
        }
        
        if let minScaleFactor = config.minScaleFactor {
            pdfView.minScaleFactor = minScaleFactor
        }
        
        if let maxScaleFactor = config.maxScaleFactor {
            pdfView.maxScaleFactor = maxScaleFactor
        }
        
        if let pageBreakMargins = config.pageBreakMargins {
            pdfView.pageBreakMargins = pageBreakMargins
        }
        
        if let pageShadowsEnabled = config.pageShadowsEnabled {
            pdfView.pageShadowsEnabled = pageShadowsEnabled
        }
        
        return pdfView
    }
    
    public func updateUIView(_ pdfView: PDFView, context: Context) {
        let displayMode = context.environment.pdfDisplayMode
        let displayDirection = context.environment.pdfDisplayDirection
        let isInMarkupMode = context.environment.isInMarkupMode
        
        if pdfView.displayMode != displayMode {
            pdfView.displayMode = displayMode
        }
        
        if pdfView.displayDirection != displayDirection {
            pdfView.displayDirection = displayDirection
        }
        
        if pdfView.isInMarkupMode != isInMarkupMode {
            pdfView.isInMarkupMode = isInMarkupMode
        }
    }
}

extension PDFViewer {
    public func makeCoordinator() -> Coordinator {
        Coordinator(self,
                    overlayProvider: overlayProvider,
                    overlayRelease: overlayRelease)
    }
    
    @MainActor
    public class Coordinator: NSObject, @MainActor PDFPageOverlayViewProvider {
        var parent: PDFViewer
        
        private var overlayProvider: PDFPageOverlayProvider
        private var overlayRelease: PDFPageOverlayRelease
        
        init(_ parent: PDFViewer,
             overlayProvider: @escaping PDFPageOverlayProvider,
             overlayRelease: @escaping PDFPageOverlayRelease) {
            self.parent = parent
            self.overlayProvider = overlayProvider
            self.overlayRelease = overlayRelease
        }
        
        public func pdfView(_ view: PDFView, overlayViewFor page: PDFPage) -> UIView? {
            overlayProvider(page)
        }
        
        public func pdfView(_ pdfView: PDFView, willEndDisplayingOverlayView overlayView: UIView, for page: PDFPage) {
            overlayRelease(page)
        }
    }
}
