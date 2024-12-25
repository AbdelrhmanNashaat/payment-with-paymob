class PaymentMethodsListModel {
  final String text;
  final String imagePath;
  int? integrationId;

  PaymentMethodsListModel({
    required this.text,
    required this.imagePath,
    this.integrationId,
  });
}
