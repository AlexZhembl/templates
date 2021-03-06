// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  typealias Color = UIColor
#endif

// swiftlint:disable file_length

// swiftlint:disable operator_usage_whitespace
extension Color {
  convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
// swiftlint:enable operator_usage_whitespace

// swiftlint:disable identifier_name line_length type_body_length
struct XCTColors {
  let rgbaValue: UInt32
  var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#339666"></span>
  /// Alpha: 100% <br/> (0x339666ff)
  static let articleBody = XCTColors(rgbaValue: 0x339666ff) // #colorLiteral(red: 0.2, green: 0.588235, blue: 0.4, alpha: 1.0)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ff66cc"></span>
  /// Alpha: 100% <br/> (0xff66ccff)
  static let articleFootnote = XCTColors(rgbaValue: 0xff66ccff)// #colorLiteral(red: 1.0, green: 0.4, blue: 0.8, alpha: 1.0)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#33fe66"></span>
  /// Alpha: 100% <br/> (0x33fe66ff)
  static let articleTitle = XCTColors(rgbaValue: 0x33fe66ff) // #colorLiteral(red: 0.2, green: 0.996078, blue: 0.4, alpha: 1.0)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
  /// Alpha: 80% <br/> (0xffffffcc)
  static let `private` = XCTColors(rgbaValue: 0xffffffcc) // #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)
}
// swiftlint:enable identifier_name line_length type_body_length

extension Color {
  convenience init(named color: XCTColors) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
