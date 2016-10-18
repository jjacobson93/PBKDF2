import PackageDescription

let package = Package(
    name: "PBKDF2",
    dependencies: [
        .Package(url: "https://github.com/jjacobson93/HMAC.git", majorVersion: 0, minor: 14)
    ]
)
