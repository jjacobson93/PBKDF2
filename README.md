# CryptoKitten

[![Build Status](https://travis-ci.org/CryptoKitten/PBKDF2.svg?branch=master)](https://travis-ci.org/CryptoKitten/PBKDF2)
[![Swift Version](https://img.shields.io/badge/swift-3.0-orange.svg)](https://swift.org)
![License](https://img.shields.io/github/license/CryptoKitten/PBKDF2.svg)
[![Slack Status](http://orlandos.nl:3000/badge.svg)](http://orlandos.nl:3000/)

A set of crypto libraries for Swift, written in Swift.
 
## MD5
 
PBKDF2 is a library that provides PBKDF2 key derivation support on top of CryptoEssentials using your preferred hashing function with HMAC.

## Usage

```swift
var passwordBytes = [UInt8]("hunter2".utf8), salt = [UInt8]("r4nd0ms4lT!".utf8)

let sha1hash = try PBKDF2<SHA1>.calculate(passwordBytes, salt: salt, iterations: 10000)

// You can use other algorithms too, and strings for passwords
let sha256hash = try PBKDF2<SHA2<SHA256>>.calculate("mypassword", salt: salt, iterations: 10000)

// Plus you can specify the return key size
// Also.. please don't use PBKDF2 with MD5 for password hashing..
let sha1hash = try PBKDF2<MD5>.calculate(passwordBytes, salt: salt, iterations: 10000, keySize: 128)

print(sha256hash.hexString)
```

## License

**CryptoKitten uses parts of [CryptoSwift](https://github.com/krzyzanowskim/CryptoSwift) whose license is included below.
Parts where CryptoSwift code is used have this license included in the file**

Copyright (C) 2014 Marcin Krzyżanowski marcin.krzyzanowski@gmail.com This software is provided 'as-is', without any express or implied warranty.

In no event will the authors be held liable for any damages arising from the use of this software.

Permission is granted to anyone to use this software for any purpose, including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:

    The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation is required.
    Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.
    This notice may not be removed or altered from any source or binary distribution.
