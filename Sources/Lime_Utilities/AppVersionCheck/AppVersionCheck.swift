//
//  File.swift
//  
//
//  Created by Limefriends on 6/4/24.
//

import Foundation

public struct AppVersionCheck {
    public static func getVersion() -> String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        return version
    }
}
