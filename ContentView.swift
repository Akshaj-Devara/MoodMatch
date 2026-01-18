//ContentView
import SwiftUI

extension Color {
    static let jetBlack = Color(hex: "#122C34")
    static let yaleBlue = Color(hex: "#224870")
    static let frenchBlue = Color(hex: "#2A4494")
    static let freshSky = Color(hex: "#4EA5D9")
    static let lightCyan = Color(hex: "#E1FAFC")
    static let gray1 = Color(hex: "#1f2026")
    
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}
