import SwiftUI
import PDFKit

public struct PDFViewer: UIViewRepresentable {
    let document: PDFDocument
    
    public init(document: PDFDocument) {
        self.document = document
    }
    
    public func makeUIView(context: Context) -> PDFView {
       return PDFView()
    }
    
    public func updateUIView(_ view: PDFView, context: Context) {
       
    }
}
