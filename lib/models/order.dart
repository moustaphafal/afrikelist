class Order {
  String id;
  String customerName;
  String customerPhone;
  String description;
  String acompte;
  String orderDate;
  String operatorName;
  bool isConfirmed;
  bool isShipped;
  String shippingDate;
  bool isCompleted;
  String completionDate;

  Order(
      {this.id,
      this.customerName,
      this.customerPhone,
      this.description,
      this.acompte,
      this.orderDate,
      this.operatorName,
      this.isConfirmed,
      this.isShipped,
      this.shippingDate,
      this.isCompleted,
      this.completionDate});
}
