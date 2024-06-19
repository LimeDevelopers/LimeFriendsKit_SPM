// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LimeFriendsKit_SPM",
    products: [
        .library(
            name: "Lime_UIComponents",
            targets: ["Lime_UIComponents"]),
        .library(name: "Lime_Utilities",
                 targets: ["Lime_Utilities"])
    ],
    dependencies: [
        // Alamofire 패키지를 종속성으로 추가합니다.
        .package(url: "https://github.com/SnapKit/SnapKit.git", from : "5.0.1"),
    ],
    targets: [
        .target(
            name: "Lime_UIComponents", dependencies: ["SnapKit"]),
        .target(name: "Lime_Utilities", dependencies: [])
//        .testTarget(
//            name: "LimeFriendsKit_SPMTests",
//            dependencies: []),
    ]
)
