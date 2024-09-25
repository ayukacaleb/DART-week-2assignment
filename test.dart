void main() {
  // Sample item prices in the cart
  List<double> cartItems = [5.0, 15.0, 30.0, 9.99, 25.0];

  // Step 1: Filter items above a certain threshold using an anonymous function
  var filteredItems = cartItems.where((price) => price >= 10).toList();
  print("Filtered Items: $filteredItems");

  // Step 2: Apply a discount of 20% using a higher-order function
  double discountPercentage = 20.0;
  List<double> discountedItems = applyDiscount(filteredItems, (price) {
    return price * (1 - discountPercentage / 100);
  });

  // Step 3: Calculate total after discount
  double totalBeforeTax = calculateTotal(discountedItems);
  print("Total before tax: \$${totalBeforeTax.toStringAsFixed(2)}");

  // Step 4: Calculate total with tax (assuming a tax rate of 8%)
  double taxRate = 0.08;
  double totalWithTax = totalBeforeTax * (1 + taxRate);
  print("Total with tax: \$${totalWithTax.toStringAsFixed(2)}");

  // Step 5: Calculate additional special discount using the recursive function
  int itemCount = discountedItems.length;
  double factorialDiscount = totalWithTax * (calculateFactorialDiscount(itemCount) / 100);
  double finalPrice = totalWithTax - factorialDiscount;
  print("Final price after factorial discount: \$${finalPrice.toStringAsFixed(2)}");
}

// Function to calculate total price
double calculateTotal(List<double> prices) {
  return prices.fold(0.0, (total, price) => total + price);
}

// Higher-order function to apply a discount
List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map(discountFunction).toList();
}

// Recursive function to calculate factorial discount percentage
double calculateFactorialDiscount(int n) {
  if (n <= 1) return 1.0; // 1! = 1
  return n * calculateFactorialDiscount(n - 1);
}
