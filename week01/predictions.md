# Week 1 Predictions

| Step | Prediction: what will you see? | What you saw | Same? |
|---|---|---|---|
| a. Change `'Hello World!'` in `lib/main.dart` to a greeting in your language, then press `r` | The text on screen updates immediately without restarting the app | The text updated immediately | Yes |
| b. Change `runApp(const MainApp())` to `runApp(const Placeholder())`, then press `r` | Nothing changes because hot reload does not rerun `main()` | Nothing changed | Yes |
| c. With the change from b still there, press `R` | The screen re-executes `main()` and displays the Placeholder | A big box with an X appeared | Yes |

## Task 5: Check Assistant Answer (capitalizeWords)

### Predictions vs Results:
- `capitalizeWords('addis ababa')` -> Returns `'Addis Ababa'`
- `capitalizeWords('hello  world')` (two spaces) -> Crashes with RangeError on `word[0]` because `split(' ')` creates empty string elements `""`.
- `capitalizeWords('')` (empty string) -> Crashes with RangeError on `word[0]`.

### Errors in the assistant's explanation:
1. **Claim:** `"split(' ') breaks the text into words. It ignores repeated spaces..."`
   - **Error:** False. `split(' ')` does not ignore repeated spaces; it creates empty strings `""`.
2. **Claim:** `"Tip: for a single word you can also simply call 'hello'.capitalize()..."`
   - **Error:** False. Dart standard library does not provide a `.capitalize()` method on `String`.
3. **Claim:** `"This function handles all inputs safely."`
   - **Error:** False. It crashes on empty strings and multiple spaces.
