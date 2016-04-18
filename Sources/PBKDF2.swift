//
//  PBKDF2.swift
//  CryptoKitten
//
//  Created by Joannis Orlandos on 29/03/16.
//
//

import HMAC
import CryptoEssentials

public final class PBKDF2<Variant: HashProtocol> {
    /// Used for applying an HMAC variant on a password and salt
    private static func digest(_ password: [UInt8], data: [UInt8]) throws -> [UInt8] {
        return HMAC<Variant>.authenticate(message: data, withKey: password)
    }
    
    /// Applies the `hi` (PBKDF2 with HMAC as PseudoRandom Function)
    public static func calculate(_ password: [UInt8], salt: [UInt8], iterations: Int) throws -> [UInt8] {
        var salt = salt
        salt.append(contentsOf: [0, 0, 0, 1])
        
        var ui = try digest(password, data: salt)
        var u1 = ui
        
        for _ in 0..<iterations - 1 {
            u1 = try digest(password, data: u1)
            ui = xor(ui, u1)
        }
        
        return ui
    }
    
    /// Applies the `hi` (PBKDF2 with HMAC as PseudoRandom Function)
    public static func calculate(_ password: String, salt: [UInt8], iterations: Int) throws -> [UInt8] {
        var passwordBytes = [UInt8]()
        passwordBytes.append(contentsOf: password.utf8)
        
        return try self.calculate(passwordBytes, salt: salt, iterations: iterations)
    }
}