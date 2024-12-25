import 'billing_data.dart';

class PaymentTokenModel {
  final String authToken;
  final String amountCents;
  final int expiration;
  final String currency;
  final int orderId;
  final int integrationId;
  final BillingData billingData;
  final String lockOrderWhenPaid;

  PaymentTokenModel({
    required this.authToken,
    required this.amountCents,
    required this.expiration,
    required this.currency,
    required this.orderId,
    required this.integrationId,
    required this.billingData,
    required this.lockOrderWhenPaid,
  });

  factory PaymentTokenModel.fromJson(Map<String, dynamic> json) {
    return PaymentTokenModel(
      authToken: json['auth_token'] as String,
      amountCents: json['amount_cents'] as String,
      expiration: json['expiration'] as int,
      currency: json['currency'] as String,
      orderId: json['order_id'] as int,
      integrationId: json['integration_id'] as int,
      billingData: BillingData.fromJson(json['billing_data']),
      lockOrderWhenPaid: json['lock_order_when_paid'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'auth_token': authToken,
        'amount_cents': amountCents,
        'expiration': expiration,
        'currency': currency,
        'order_id': orderId,
        'integration_id': integrationId,
        'billing_data': billingData.toJson(),
        'lock_order_when_paid': lockOrderWhenPaid,
      };
}
