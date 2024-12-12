import 'item.dart';
import 'shipping_data.dart';
import 'shipping_details.dart';

class OrderDataModel {
  final String authToken;
  final String deliveryNeeded;
  final String amountCents;
  String? currency;
  int? merchantOrderId;
  final List<Item> items;
  ShippingData? shippingData;
  ShippingDetails? shippingDetails;

  OrderDataModel({
    this.currency,
    this.merchantOrderId,
    this.shippingData,
    this.shippingDetails,
    required this.authToken,
    required this.deliveryNeeded,
    required this.amountCents,
    required this.items,
  });

  factory OrderDataModel.fromJson(Map<String, dynamic> json) {
    return OrderDataModel(
      authToken: json['auth_token'] as String,
      deliveryNeeded: json['delivery_needed'] as String,
      amountCents: json['amount_cents'] as String,
      currency: json['currency'] as String?,
      merchantOrderId: json['merchant_order_id'] as int?,
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      shippingData: json['shipping_data'] == null
          ? null
          : ShippingData.fromJson(
              json['shipping_data'] as Map<String, dynamic>),
      shippingDetails: json['shipping_details'] == null
          ? null
          : ShippingDetails.fromJson(
              json['shipping_details'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'auth_token': authToken,
        'delivery_needed': deliveryNeeded,
        'amount_cents': amountCents,
        'currency': currency,
        'merchant_order_id': merchantOrderId,
        'items': items.map((e) => e.toJson()).toList(),
        'shipping_data': shippingData?.toJson(),
        'shipping_details': shippingDetails?.toJson(),
      };
}
