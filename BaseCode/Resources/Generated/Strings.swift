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
    /// Add
    internal static let add = L10n.tr("Localizable", "add", fallback: "Add")
    /// Age
    internal static let age = L10n.tr("Localizable", "age", fallback: "Age")
    /// and the
    internal static let andThe = L10n.tr("Localizable", "andThe", fallback: "and the")
    /// Cancel
    internal static let cancel = L10n.tr("Localizable", "cancel", fallback: "Cancel")
    /// Charts
    internal static let charts = L10n.tr("Localizable", "charts", fallback: "Charts")
    /// Continue
    internal static let `continue` = L10n.tr("Localizable", "continue", fallback: "Continue")
    /// Create profile
    internal static let createProfile = L10n.tr("Localizable", "createProfile", fallback: "Create profile")
    /// Error
    internal static let error = L10n.tr("Localizable", "error", fallback: "Error")
    /// Female
    internal static let female = L10n.tr("Localizable", "female", fallback: "Female")
    /// Gender
    internal static let gender = L10n.tr("Localizable", "gender", fallback: "Gender")
    /// Based on your age and biological sex, we show you our reference values.
    internal static let genderDescription = L10n.tr("Localizable", "genderDescription", fallback: "Based on your age and biological sex, we show you our reference values.")
    /// Get Started
    internal static let getStarted = L10n.tr("Localizable", "getStarted", fallback: "Get Started")
    /// Home
    internal static let home = L10n.tr("Localizable", "home", fallback: "Home")
    /// I accept the
    internal static let iAcceptThe = L10n.tr("Localizable", "iAcceptThe", fallback: "I accept the")
    /// Kindly Add Age
    internal static let kindlyAddAge = L10n.tr("Localizable", "kindlyAddAge", fallback: "Kindly Add Age")
    /// Kindly Add Image
    internal static let kindlyAddImage = L10n.tr("Localizable", "kindlyAddImage", fallback: "Kindly Add Image")
    /// Kindly Add Name
    internal static let kindlyAddName = L10n.tr("Localizable", "kindlyAddName", fallback: "Kindly Add Name")
    /// kindly Select Gender
    internal static let kindlySelectGender = L10n.tr("Localizable", "kindlySelectGender", fallback: "kindly Select Gender")
    /// Male
    internal static let male = L10n.tr("Localizable", "male", fallback: "Male")
    /// More
    internal static let more = L10n.tr("Localizable", "more", fallback: "More")
    /// Name
    internal static let name = L10n.tr("Localizable", "name", fallback: "Name")
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
    /// privacy policy.
    internal static let privacyPolicy = L10n.tr("Localizable", "privacyPolicy", fallback: "privacy policy.")
    /// Privacy is important to us
    internal static let privacyTitle = L10n.tr("Localizable", "privacyTitle", fallback: "Privacy is important to us")
    /// I agree that my anonymized data may be used to promote research.
    internal static let researchDescription = L10n.tr("Localizable", "researchDescription", fallback: "I agree that my anonymized data may be used to promote research.")
    /// Select Avatar
    internal static let selectAvatar = L10n.tr("Localizable", "selectAvatar", fallback: "Select Avatar")
    /// Save Changes
    internal static let selectChanges = L10n.tr("Localizable", "selectChanges", fallback: "Save Changes")
    /// Select Your Age
    internal static let selectYourAge = L10n.tr("Localizable", "selectYourAge", fallback: "Select Your Age")
    /// terms and conditions
    internal static let termsAndConditions = L10n.tr("Localizable", "termsAndConditions", fallback: "terms and conditions")
    /// terms of use
    internal static let termsOfUse = L10n.tr("Localizable", "termsOfUse", fallback: "terms of use")
    /// the
    internal static let the = L10n.tr("Localizable", "the", fallback: "the")
    /// Values
    internal static let values = L10n.tr("Localizable", "values", fallback: "Values")
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
