class Order {
  String id;
  String customerName;
  String customerPhone;
  String description;
  String acompte;
  String orderDate;
  String operatorName;
  bool isConfirmed;
  bool isCompleted;
  String completionDate;
  String showDate() {
    DateTime today =
        DateTime.fromMillisecondsSinceEpoch(int.parse(this.orderDate));
    String date =
        "${today.day.toString()}/${today.month.toString().padLeft(2, '0')}/${today.year.toString().padLeft(2, '0')} at ${today.hour.toString().padLeft(2, '0')}:${today.minute.toString().padLeft(2, '0')}";
    return date;
  }

  Order(
      {this.id,
      this.customerName,
      this.customerPhone,
      this.description,
      this.acompte,
      this.orderDate,
      this.operatorName,
      this.isConfirmed,
      this.isCompleted,
      this.completionDate});
}
