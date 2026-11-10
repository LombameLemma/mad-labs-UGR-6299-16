# AI Note - Week 3

1. Which task did you use an assistant for?
   Task 3 (reviewing the LayoutBuilder breakpoint implementation) and Task 5 (critiquing the saved assistant timetable code).

2. What did it get wrong, or what did you not understand?
   In Task 5, the assistant claimed that Row bounds its children horizontally and that Spacer prevents overflow when text is long. Both are incorrect according to the Flutter constraint model.

3. What did you check yourself, and how?
   Checked layout behavior with `flutter analyze --fatal-infos` and `flutter test`. Verified responsive behavior at 320 px, 360 px, and 900 px widths.

