String fizzBuzz(int n) {
  if (n % 15 == 0) return 'FizzBuzz';
  if (n % 3 == 0) return 'Fizz';
  if (n % 5 == 0) return 'Buzz';
  return '$n';
}

double averageOfPositives(List<double> numbers) {
  final positives = numbers.where((n) => n > 0).toList();
  if (positives.isEmpty) return 0.0;
  return positives.fold(0.0, (sum, n) => sum + n) / positives.length;
}

String bmiCategory(double bmi) {
  if (bmi <= 0) {
    throw ArgumentError.value(bmi, 'bmi', 'must be greater than zero');
  }
  return switch (bmi) {
    < 18.5 => 'Underweight',
    < 25.0 => 'Normal',
    < 30.0 => 'Overweight',
    _ => 'Obese',
  };
}

bool isPalindrome(String text) {
  final cleaned = text.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
  return cleaned == cleaned.split('').reversed.join();
}

Map<String, int> letterCount(String text) {
  final counts = <String, int>{};
  final letterRegex = RegExp(r'[a-z]');
  for (final char in text.toLowerCase().split('')) {
    if (!letterRegex.hasMatch(char)) continue;
    counts.update(char, (count) => count + 1, ifAbsent: () => 1);
  }
  return counts;
}

double convertDistance(double value, {bool toKilometres = false}) {
  const milesPerKm = 0.621371;
  final result = toKilometres ? (value / milesPerKm) : (value * milesPerKm);
  return (result * 10).roundToDouble() / 10;
}

List<int> fibonacci(int count) {
  if (count <= 0) return <int>[];
  final result = <int>[];
  var a = 0;
  var b = 1;
  for (var i = 0; i < count; i++) {
    result.add(a);
    final next = a + b;
    a = b;
    b = next;
  }
  return result;
}

String summarise(Object? value) {
  return switch (value) {
    null => 'no value',
    final bool b => b ? 'yes' : 'no',
    double() => 'a decimal number',
    final String s => '"$s" has ${s.length} characters',
    final Map<Object?, Object?> m => 'a map with ${m.length} entries',
    _ => 'unknown',
  };
}
