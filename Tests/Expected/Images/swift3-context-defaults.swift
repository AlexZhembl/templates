// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSImage
  typealias Image = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  typealias Image = UIImage
#endif

// swiftlint:disable file_length

// swiftlint:disable identifier_name
// swiftlint:disable line_length
// swiftlint:disable type_body_length
enum Asset: String {
  case exoticBanana = "Exotic/Banana"
  case exoticMango = "Exotic/Mango"
  case `private` = "private"
  case roundApricot = "Round/Apricot"
  case roundOrange = "Round/Orange"
  case roundApple = "Round/Apple"
  case roundDoubleCherry = "Round/Double/Cherry"
  case roundTomato = "Round/Tomato"
}
// swiftlint:enable identifier_name
// swiftlint:enable line_length
// swiftlint:enable type_body_length

extension Asset {
  var image: Image {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    let image = Image(named: rawValue, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: rawValue)
    #elseif os(watchOS)
    let image = Image(named: rawValue)
    #endif
    guard let result = image else { fatalError("Unable to load image \(rawValue).") }
    return result
  }
}

extension Image {
  convenience init!(asset: Asset) {
    #if os(iOS) || os(tvOS)
    let bundle = Bundle(for: BundleToken.self)
    self.init(named: asset.rawValue, in: bundle, compatibleWith: nil)
    #elseif os(OSX) || os(watchOS)
    self.init(named: asset.rawValue)
    #endif
  }
}

private final class BundleToken {}
