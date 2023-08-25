// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum InfoPlist {
    }
  internal enum Localizable {
    /// Cancel
    internal static let cancel = L10n.tr("Localizable", "cancel", fallback: "Cancel")
    /// Continue
    internal static let `continue` = L10n.tr("Localizable", "continue", fallback: "Continue")
    /// Error
    internal static let error = L10n.tr("Localizable", "error", fallback: "Error")
    /// Get Started
    internal static let getStarted = L10n.tr("Localizable", "getStarted", fallback: "Get Started")
    /// Localizable.strings
    ///   BaseCode
    /// 
    ///   Created by  on 27/07/2023.
    internal static let ok = L10n.tr("Localizable", "ok", fallback: "Ok")
    /// Just take a picture and we will do the rest or enter them manually
    internal static let onboarding1Description = L10n.tr("Localizable", "onboarding1Description", fallback: "Just take a picture and we will do the rest or enter them manually")
    /// Upload your lab findings
    internal static let onboarding1Title = L10n.tr("Localizable", "onboarding1Title", fallback: "Upload your lab findings")
    /// We do not need any personal information and your lab results are stored locally on your phone
    internal static let onboarding2Description = L10n.tr("Localizable", "onboarding2Description", fallback: "We do not need any personal information and your lab results are stored locally on your phone")
    /// We protect your privacy
    internal static let onboarding2Title = L10n.tr("Localizable", "onboarding2Title", fallback: "We protect your privacy")
    /// Get all the important information about your lab values
    internal static let onboarding3Description = L10n.tr("Localizable", "onboarding3Description", fallback: "Get all the important information about your lab values")
    /// Progressions, normal values and causes
    internal static let onboarding3Title = L10n.tr("Localizable", "onboarding3Title", fallback: "Progressions, normal values and causes")
    /// Just quickly create a profile and you're ready to go
    internal static let onboarding4Description = L10n.tr("Localizable", "onboarding4Description", fallback: "Just quickly create a profile and you're ready to go")
    /// Here we go!
    internal static let onboarding4Title = L10n.tr("Localizable", "onboarding4Title", fallback: "Here we go!")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
