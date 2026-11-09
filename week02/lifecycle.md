# Widget Architecture Decisions

| Widget | Stateless or stateful? | Why |
|---|---|---|
| `CampusCompanionApp` (`lib/app.dart`) | Stateless | It only configures the MaterialApp (theme, title, home) and holds no values that mutate on screen. |
| `HomeScreen` (`lib/screens/home_screen.dart`) | Stateful | It owns and mutates two pieces of changing state: the `_checkIns` counter and the `_showLogger` boolean toggle. |
| `LifecycleLogger` (`lib/widgets/lifecycle_logger.dart`) | Stateful | It tracks and mutates its own internal `_buildCount` and must observe lifecycle callbacks across rebuilds. |

## Lifecycle Callback Predictions & Observations

| Step | Prediction (callbacks in order; card text) | Console output | Same? |
|---|---|---|---|
| 1. Turn the switch on | `initState`, `didChangeDependencies`, `build #1`; card shows `Check-ins: 0 — built 1 time(s)` | `[LifecycleLogger] initState`, `didChangeDependencies`, `build #1` | Yes |
| 2. Press the FAB three times | 3 cycles of `didUpdateWidget`, `build #2`, `#3`, `#4`; card shows `Check-ins: 3 — built 4 time(s)` | `didUpdateWidget`, `build #2`, `build #3`, `build #4` | Yes |
| 3. Turn the switch off | `dispose`; card removed from tree | `[LifecycleLogger] dispose` | Yes |
| 4. Turn the switch on again | `initState`, `didChangeDependencies`, `build #1`; counter resets to 1 because a brand new State object is created | `initState`, `didChangeDependencies`, `build #1` | Yes |
