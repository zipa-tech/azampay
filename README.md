# [**AzamPay**](https://pub.dev/packages/azampay/)

[![Made in Tanzania](https://img.shields.io/badge/made%20in-tanzania-008751.svg?style=flat-square)](https://github.com/Tanzania-Developers-Community/made-in-tanzania)

This is a Dart-Flutter SDK that helps users integrate [**AzamPay**](https://azampay.com/) in their projects. You can view AzamPay documentation [here](https://developers.azampay.co.tz/sandbox/documentation)


### Use Case

[SDK SetUp]()
1. Import azampay in [your.dart]() file
```dart
    import 'package:azampay/azampay.dart';
```

2. Initiate your Credentials
```dart
// get these credentials from the azampay developers account
var azampay = AzamPay(
    sandbox: true, // set to false on production
    appName: "<app-name>",
    clientId: "<client-id>",
    clientSecret:"<client-secret>"
);
```

[CHECKOUTS]()

### MOBILE PUSH CHECKOUT
```dart
void main() async {
    
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
}

```

### BANK CHECKOUT
```dart
    
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
webhookResponse: {'message': 'This is emulated Message', 'user': None,
    'password': None,    'clientId': None, 'transactionstatus': 'success', 
    'operator': '<provider>', 'reference': '<uuid>', 'externalreference': '<uuid>',
    'utilityref': 'Gr5HI85KbbR790', 'amount': '<amount>', 'transid': '<uuid>', 'msisdn': '255xxxxx', 'submerchantAcc': None, 'additionalProperties': {}
    }
}
```

## Credits and Inspiration
1. Thanks much to AzamPay for this wonderful payment system
2. Tanzanian Devs using AzamPay

## Issues
Please open an issue here [**GITHUB**](https://github.com/zipa-tech/azampay/)