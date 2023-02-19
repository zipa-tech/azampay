import 'package:azampay/azampay.dart';
import 'dart:convert';

void main() async {

    
    var azampay = AzamPay(
      sandbox: true, // set to false on production
      appName: "<app-name>",
      clientId: "<client-id>",
      clientSecret:"<client-secret>"
    );


    // MOBILE PUSH CHECKOUT
    var mobileResponse = await azampay.mobileCheckout(
        merchantMobileNumber: "<merchant-mobile-number>",
        amount: "<amount>",
        currency: "<currency>", // ["TZS"]
        provider: "<provider>", // ["Airtel" "Tigo" "Halopesa" "Azampesa"]
        externalId: "<external-id>",
        additionalProperties: {}
        );
        
    print(json.decode(mobileResponse.body));




    //  BANK CHECKOUT
    var bankResponse = await azampay.bankCheckout(
      merchantAccountNumber: "<merchant-account-number>",
      merchantName:"<merchant-name>",
      merchantMobileNumber: "<merchant-mobile-number>",
      amount: "<amount>",
      currency: "<currency>", // ["TZS"]
      provider: "<bank>", // ["NMB","CRDB"]
      otp: "<otp>",
      referenceId: '<external-id>',
      additionalProperties: { 
    });

}
