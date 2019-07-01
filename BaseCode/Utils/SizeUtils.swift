//
//  ScreenSizeAndDeviceUtils.swift
//  BaseCode
//
//  Created by BrainX Technologies on 01/07/2019.
//  Copyright © 2019 Brainx Technologies. All rights reserved.
//

import UIKit

func ip5(_ value: CGFloat) -> CGFloat {
    return value / 640 * UIScreen.main.bounds.width
}

func ip6(_ value: CGFloat) -> CGFloat {
    return value / 750 * UIScreen.main.bounds.width
}

func ip6plus(_ value: CGFloat) -> CGFloat {
    return value / 1080 * UIScreen.main.bounds.width
}

func ip5Point(_ value: CGFloat) -> CGFloat {
    return value / 320 * UIScreen.main.bounds.width
}

func ip6Point(_ value: CGFloat) -> CGFloat {
    return value / 375 * UIScreen.main.bounds.width
}

func ip6plusPoint(_ value: CGFloat) -> CGFloat {
    return value / 414 * UIScreen.main.bounds.width
}

struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    
    static let IS_IPHONE  = UIDevice.current.userInterfaceIdiom == .phone
    static let IS_IPAD    = UIDevice.current.userInterfaceIdiom == .pad
}
