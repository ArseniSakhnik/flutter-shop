class TPricingCalculator {
  /// Calculate total price based on tax and shipping
  static double calculateTotalPrice(
      double productPrice,
      String location,
      ) {
    final double taxRate = getTaxRateForLocation(location);
    final double taxAmount = productPrice * taxRate;

    final double shippingCost = getShippingCost(location);

    final double totalPrice =
        productPrice + taxAmount + shippingCost;

    return totalPrice;
  }

  /// Calculate shipping cost
  static String calculateShippingCost(
      double productPrice,
      String location,
      ) {
    final double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  /// Calculate tax
  static String calculateTax(
      double productPrice,
      String location,
      ) {
    final double taxRate = getTaxRateForLocation(location);
    final double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  /// Get tax rate based on location
  static double getTaxRateForLocation(String location) {
    switch (location) {
      case 'US':
        return 0.07;
      case 'EU':
        return 0.20;
      case 'UK':
        return 0.18;
      default:
        return 0.10;
    }
  }

  /// Get shipping cost based on location
  static double getShippingCost(String location) {
    switch (location) {
      case 'US':
        return 5.0;
      case 'EU':
        return 10.0;
      case 'UK':
        return 8.0;
      default:
        return 12.0;
    }
  }
}
