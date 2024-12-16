import 'billing_data.dart';
import 'extras.dart';
import 'item.dart';

class IntentionModel {
  final int amount;
  final String currency;
  final List<int> paymentMethods;
  final List<Item> items;
  final BillingData billingData;
  final Extras extras;
  final String specialReference;
  final String notificationUrl;
  final String redirectionUrl;

  IntentionModel({
    required this.amount,
    required this.currency,
    required this.paymentMethods,
    required this.items,
    required this.billingData,
    required this.extras,
    required this.specialReference,
    required this.notificationUrl,
    required this.redirectionUrl,
  });

  factory IntentionModel.fromJson(Map<String, dynamic> json) {
    return IntentionModel(
      amount: json['amount'] as int,
      currency: json['currency'] as String,
      paymentMethods: json['payment_methods'] as List<int>,
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      billingData:
          BillingData.fromJson(json['billing_data'] as Map<String, dynamic>),
      extras: Extras.fromJson(json['extras'] as Map<String, dynamic>),
      specialReference: json['special_reference'] as String,
      notificationUrl: json['notification_url'] as String,
      redirectionUrl: json['redirection_url'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'currency': currency,
        'payment_methods': paymentMethods,
        'items': items.map((e) => e.toJson()).toList(),
        'billing_data': billingData.toJson(),
        'extras': extras.toJson(),
        'special_reference': specialReference,
        'notification_url': notificationUrl,
        'redirection_url': redirectionUrl,
      };
}
