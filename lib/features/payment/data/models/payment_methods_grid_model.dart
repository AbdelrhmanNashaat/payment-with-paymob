class PaymentMethodsGridModel {
  final String text;
  final String imagePath;
  int? integrationId;

  PaymentMethodsGridModel({
    required this.text,
    required this.imagePath,
    this.integrationId,
  });
}
