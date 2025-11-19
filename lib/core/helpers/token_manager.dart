import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// TokenManager - Service to handle token storage and retrieval
///
/// Features:
/// - Secure token storage using FlutterSecureStorage
/// - In-memory caching for better performance
/// - Auto-clear on app uninstall (FlutterSecureStorage default behavior)
/// - Token persists between app launches
///
/// Usage:
/// ```dart
/// // Save token
/// await TokenManager.saveToken('your_token_here');
///
/// // Get token
/// String? token = await TokenManager.getToken();
///
/// // Check if token exists
/// bool hasToken = await TokenManager.hasToken();
///
/// // Clear token (logout)
/// await TokenManager.clearToken();
/// ```
class TokenManager {
  TokenManager._();

  // Private static constants
  static const String _tokenKey = 'user_auth_token';
  static const String _refreshTokenKey = 'user_refresh_token';

  // Singleton instance of FlutterSecureStorage
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );

  // In-memory cache for better performance
  static String? _cachedToken;
  static String? _cachedRefreshToken;
  static bool _isCacheInitialized = false;

  // ==================== Token Methods ====================

  /// Save user authentication token securely
  /// Also updates the in-memory cache
  static Future<void> saveToken(String token) async {
    try {
      debugPrint('TokenManager: Saving token...');
      await _secureStorage.write(key: _tokenKey, value: token);
      _cachedToken = token;
      _isCacheInitialized = true;
      debugPrint('TokenManager: Token saved successfully');
    } catch (e) {
      debugPrint('TokenManager: Error saving token - $e');
      rethrow;
    }
  }

  /// Get user authentication token
  /// Returns cached token if available, otherwise reads from secure storage
  static Future<String?> getToken() async {
    try {
      // Return cached token if available
      if (_isCacheInitialized && _cachedToken != null) {
        debugPrint('TokenManager: Returning cached token');
        return _cachedToken;
      }

      // Read from secure storage
      debugPrint('TokenManager: Reading token from secure storage');
      final token = await _secureStorage.read(key: _tokenKey);

      // Update cache
      _cachedToken = token;
      _isCacheInitialized = true;

      if (token != null) {
        debugPrint('TokenManager: Token retrieved successfully');
      } else {
        debugPrint('TokenManager: No token found');
      }

      return token;
    } catch (e) {
      debugPrint('TokenManager: Error getting token - $e');
      return null;
    }
  }

  /// Check if user has a valid token
  static Future<bool> hasToken() async {
    try {
      final token = await getToken();
      final hasValidToken = token != null && token.isNotEmpty;
      debugPrint('TokenManager: Has valid token - $hasValidToken');
      return hasValidToken;
    } catch (e) {
      debugPrint('TokenManager: Error checking token - $e');
      return false;
    }
  }

  /// Clear user authentication token (logout)
  /// Also clears the in-memory cache
  static Future<void> clearToken() async {
    try {
      debugPrint('TokenManager: Clearing token...');
      await _secureStorage.delete(key: _tokenKey);
      _cachedToken = null;
      debugPrint('TokenManager: Token cleared successfully');
    } catch (e) {
      debugPrint('TokenManager: Error clearing token - $e');
      rethrow;
    }
  }

  /// Force refresh token from storage (bypass cache)
  /// Useful when you suspect the cached token is stale
  static Future<String?> refreshToken() async {
    try {
      debugPrint('TokenManager: Force refreshing token from storage');
      _isCacheInitialized = false;
      _cachedToken = null;
      return await getToken();
    } catch (e) {
      debugPrint('TokenManager: Error refreshing token - $e');
      return null;
    }
  }

  // ==================== Refresh Token Methods ====================

  /// Save refresh token securely
  static Future<void> saveRefreshToken(String refreshToken) async {
    try {
      debugPrint('TokenManager: Saving refresh token...');
      await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);
      _cachedRefreshToken = refreshToken;
      debugPrint('TokenManager: Refresh token saved successfully');
    } catch (e) {
      debugPrint('TokenManager: Error saving refresh token - $e');
      rethrow;
    }
  }

  /// Get refresh token
  static Future<String?> getRefreshToken() async {
    try {
      // Return cached refresh token if available
      if (_cachedRefreshToken != null) {
        debugPrint('TokenManager: Returning cached refresh token');
        return _cachedRefreshToken;
      }

      // Read from secure storage
      debugPrint('TokenManager: Reading refresh token from secure storage');
      final refreshToken = await _secureStorage.read(key: _refreshTokenKey);

      // Update cache
      _cachedRefreshToken = refreshToken;

      if (refreshToken != null) {
        debugPrint('TokenManager: Refresh token retrieved successfully');
      } else {
        debugPrint('TokenManager: No refresh token found');
      }

      return refreshToken;
    } catch (e) {
      debugPrint('TokenManager: Error getting refresh token - $e');
      return null;
    }
  }

  /// Clear refresh token
  static Future<void> clearRefreshToken() async {
    try {
      debugPrint('TokenManager: Clearing refresh token...');
      await _secureStorage.delete(key: _refreshTokenKey);
      _cachedRefreshToken = null;
      debugPrint('TokenManager: Refresh token cleared successfully');
    } catch (e) {
      debugPrint('TokenManager: Error clearing refresh token - $e');
      rethrow;
    }
  }

  // ==================== Utility Methods ====================

  /// Clear all tokens (both access and refresh)
  /// Use this for complete logout
  static Future<void> clearAllTokens() async {
    try {
      debugPrint('TokenManager: Clearing all tokens...');
      await Future.wait([
        clearToken(),
        clearRefreshToken(),
      ]);
      _isCacheInitialized = false;
      debugPrint('TokenManager: All tokens cleared successfully');
    } catch (e) {
      debugPrint('TokenManager: Error clearing all tokens - $e');
      rethrow;
    }
  }

  /// Clear all secure storage data
  /// WARNING: This will delete ALL data from secure storage, not just tokens
  static Future<void> clearAllSecureData() async {
    try {
      debugPrint('TokenManager: Clearing all secure storage data...');
      await _secureStorage.deleteAll();
      _cachedToken = null;
      _cachedRefreshToken = null;
      _isCacheInitialized = false;
      debugPrint('TokenManager: All secure storage data cleared successfully');
    } catch (e) {
      debugPrint('TokenManager: Error clearing secure storage - $e');
      rethrow;
    }
  }

  /// Check if token is expired (basic check based on token structure)
  /// Note: This is a basic implementation. For production, you should decode
  /// the JWT and check the exp claim
  static bool isTokenExpired(String? token) {
    if (token == null || token.isEmpty) {
      debugPrint('TokenManager: Token is null or empty');
      return true;
    }

    try {
      // Basic JWT structure check
      final parts = token.split('.');
      if (parts.length != 3) {
        debugPrint('TokenManager: Invalid token structure');
        return true;
      }

      // For more robust expiry check, decode the payload and check exp claim
      // This requires a JWT library like 'dart_jsonwebtoken' or 'jose'

      debugPrint('TokenManager: Token structure is valid');
      return false;
    } catch (e) {
      debugPrint('TokenManager: Error checking token expiry - $e');
      return true;
    }
  }
}