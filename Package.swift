// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YoungMinSampleSPM",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "YoungMinSampleSPM",
            type: .dynamic,
            targets: ["YoungMinSampleSPM"]),
        
            .library(
                name: "Target1",
                targets: ["Target1"])
        
    ],
    // dependency를 추가해준다.
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "YoungMinSampleSPM", dependencies: ["Moya"]),
        
        .target(name: "Target1", dependencies: []),
        
        .testTarget(
            name: "YoungMinSampleSPMTests",
            dependencies: ["YoungMinSampleSPM"]
        ),
        // binary 배포시에는 zip 파일을 release에 업로드 한다.
        // zip 파일에 대한 SHA-256 값을 구해 checksum에 넣는다. (무결성 체크)
//        .binaryTarget(name: "YoungMinSampleSPM", url: "https://github.com/your-id/YoungminSampleFramework/releases/download/1.0.0/YoungminSampleFramework.xcframework.zip", checksum: "")
    ]
)
