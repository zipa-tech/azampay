# [**AzamPay**](https://developerdocs.azampay.co.tz/)

[![Made in Tanzania](https://img.shields.io/badge/made%20in-tanzania-008751.svg?style=flat-square)](https://github.com/Tanzania-Developers-Community/made-in-tanzania)

This is a Dart-Flutter SDK that helps users integrate [**AzamPay**](https://azampay.com/) in their projects. 

## USE CASE EXAMPLE
```dart
import 'package:azampay/azampay.dart';

void main() async {

    // get these credentials from the azampay developers account
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

    // successful mobile checkout response (you can now see a push USSD on your phone)
    chekout_response: {
        success: true, transactionId: e06a98b0267a4196913e4c5b4c8b69e3, 
        message: Your request has been received and is being processed.
    }


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

    // status code
    print(bankResponse.statusCode);
    
    // body
    print(json.decode(bankResponse.body));


    // MOBILE CHECKOUT WEBHOOK RESPONSE ON SANDBOX MODE
    webhookResponse: {'message': 'This is emulated Message', 'user': None, 'password': None, 'clientId': None, 'transactionstatus': 'success', 'operator': '<provider>', 'reference': '<uuid>', 'externalreference': '<uuid>', 'utilityref': 'Gr5HI85KbbR790', 'amount': '<amount>', 'transid': '<uuid>', 'msisdn': '255xxxxx', 'submerchantAcc': None, 'additionalProperties': {}
    }
}
```

## Credits and Inspiration
AzamPay

[*GITHUB](https://github.com/zipa-tech/azampay/)