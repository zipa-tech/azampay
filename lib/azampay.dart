library azampay;

import 'dart:convert';
import 'package:http/http.dart' as http;

class AzamPay {
  AzamPay({
    this.sandbox = true,
    required this.appName,
    required this.clientId,
    required this.clientSecret,
    this.xApiKey,
  }) {
    // initialise
  }

  //  defaults for the variables
  final bool sandbox;

  // CREDENTIALS
  final String appName;
  final String clientId;
  final String clientSecret;
  final String? xApiKey;

  //  URLS
  final String sandboxBaseUrl = "https://sandbox.azampay.co.tz";
  final String sandboxAuthyBaseUrl =
      "https://authenticator-sandbox.azampay.co.tz";
  final String productionBaseUrl = "https://checkout.azampay.co.tz";
  final String productionAuthyBaseUrl = "https://authenticator.azampay.co.tz";

  String get baseUrl {
    if (sandbox == true) {
      return sandboxBaseUrl;
    } else {
      return productionBaseUrl;
    }
  }

  String get authyBaseUrl {
    if (sandbox == true) {
      return sandboxAuthyBaseUrl;
    } else {
      return productionAuthyBaseUrl;
    }
  }

  Future<String> get accessToken async {
    var authyData = {
      'appName': appName,
      'clientId': clientId,
      'clientSecret': clientSecret
    };

    var response = await http.post(
        Uri.parse("$authyBaseUrl/AppRegistration/GenerateToken"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(authyData));

    var data = json.decode(response.body);

    return data['data']['accessToken'];
  }

  Future mobileCheckout(
      {required String merchantMobileNumber,
      required String amount,
      required String currency,
      required String provider,
      required String externalId,
      additionalProperties}) async {
    final checkoutData = {
      "accountNumber": merchantMobileNumber,
      "amount": amount,
      "currency": currency,
      "provider": provider,
      "additionalProperties": additionalProperties ?? {},
      "externalId": externalId,
    };

    var gotToken = await accessToken;

    var headers = {
      "Authorization": "Bearer $gotToken",
      "Content-Type": "application/json",
    };

    if (sandbox == false) {
      headers["X-API-Key"] = xApiKey!;
    }

    var response = await http.post(Uri.parse("$baseUrl/azampay/mno/checkout"),
        headers: headers, body: json.encode(checkoutData));

    return response;
  }

  Future bankCheckout(
      {required String merchantAccountNumber,
      required String merchantMobileNumber,
      String? merchantName,
      required String amount,
      required String currency,
      required String provider,
      required String otp,
      required String referenceId,
      additionalProperties}) async {
    final checkoutData = {
      "merchantAccountNumber": merchantAccountNumber,
      "merchantMobileNumber": merchantMobileNumber,
      "amount": amount,
      "merchantName": merchantName,
      "currencyCode": currency,
      "provider": provider,
      "otp": otp,
      "additionalProperties": additionalProperties ?? {},
      "referenceId": referenceId,
    };

    var gotToken = await accessToken;

    var headers = {
      "Authorization": "Bearer $gotToken",
      "Content-Type": "application/json",
    };

    if (sandbox == false) {
      headers["X-API-Key"] = xApiKey!;
    }

    var response = await http.post(Uri.parse("$baseUrl/azampay/bank/checkout"),
        headers: headers, body: json.encode(checkoutData));
    return response;
  }
}
