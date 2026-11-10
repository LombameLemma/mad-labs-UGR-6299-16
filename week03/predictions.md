# Week 3 Predictions

## Task 1 — Register the asset

| Step | Prediction: what will you see? | What you saw | Same? |
|---|---|---|---|
| a. Add `Image.asset('assets/images/logo.png')` to the stub `ProfileScreen`, press `R` (hot restart), switch to *Profile* | App throws an asset not found exception with console error `Unable to load asset` | `Unable to load asset: "assets/images/logo.png"` | Yes |
| b. Declare the folder in `pubspec.yaml` (step 3 below), then press `R` | The logo image appears properly in the profile screen | The AAU logo image is displayed | Yes |

## Task 2 — Self-check 2: `EventCard` without `Expanded`
- **Prediction:** If `Expanded` is removed from around the details Column in `EventCard` and the title is very long, the `Row` will give its children unbounded width. The long title text will not wrap and will extend horizontally past the screen edge, producing yellow-and-black stripes with a `RenderFlex overflowed by ... pixels on the right` error.
- **Observed:** Test fails with `A RenderFlex overflowed by 152 pixels on the right`.

## Task 3 — `EventsScreen`: list, then grid

| Step | Prediction | What you saw | Same? |
|---|---|---|---|
| a. Drag the Chrome window from narrower than 600 px to wider | The layout switches from a single-column `ListView` to a two-column `GridView` using `LayoutBuilder` | Switches smoothly from list to grid | Yes |
| b. Change `mainAxisExtent` to `120`, hot reload, look at a wide window | Event cards will be cramped vertically and the content inside will overflow the bottom edge | Yellow-and-black overflow stripes appear at bottom of cards | Yes |
| c. With `120`, run `flutter test test/screens/events_screen_test.dart`: which test fails, and with which message? | The wide-width grid test fails due to RenderFlex overflow | `A RenderFlex overflowed by 48 pixels on the bottom` | Yes |

## Task 5 — Assistant Layout Critique (`ScheduleRow`)

### 1. Initial Predictions:
- **(a) Does the code compile?** No, `FilledButton` has no parameter named `minWidth`.
- **(b) What does a 360-pixel wide phone show for "Mobile Applications Development"?** The long title pushes the `Spacer` and the *Join* button off the right edge of the screen, resulting in a right-edge `RenderFlex` overflow error because `Row` gives unbounded width to children unless wrapped in `Expanded` or `Flexible`.
- **(c) What does it show for "Compilers"?** It renders without overflow only because the string "Compilers" is short enough to fit inside 360 px along with the 56 px time SizedBox and button.

### 2. Errors identified in the code and explanation:
1. **Code error (`minWidth: 72` in `FilledButton`):**
   - *Error:* `The named parameter 'minWidth' isn't defined.`
   - *How found:* `flutter analyze`.
2. **Explanation error (Sentence 2: "A Row gives each of its children at most the width of the row"):**
   - *Error:* False. A `Row` passes unbounded horizontal constraints (width 0 to infinity) to its unexpanded children.
   - *How found:* Flutter documentation on `Row` layout algorithm.
3. **Explanation error (Sentence 3: "overflow: TextOverflow.ellipsis cuts a long course name off"):**
   - *Error:* False. Without bounded width (such as inside `Expanded`), `TextOverflow.ellipsis` cannot calculate where to cut off the text, so the text continues infinitely.
   - *How found:* `flutter test test/exercises/schedule_row_test.dart` (failed with RenderFlex overflow before fix).
4. **Explanation error (Sentence 4: "When the course name is long, the Spacer becomes zero pixels wide and everything still fits"):**
   - *Error:* False. Once the preceding children exceed the row width, `Spacer` cannot prevent overflow and causes layout failure.
   - *How found:* Running the test with a 320 px container.
5. **Fix applied:** Wrapped the course/room `Column` in `Expanded`, removed invalid `minWidth: 72`, and added 8 px spacing before `FilledButton`.

