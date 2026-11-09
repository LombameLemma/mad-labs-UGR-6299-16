# Widget Architecture Decisions

| Widget | Stateless or stateful? | Why |
|---|---|---|
| `CampusCompanionApp` (`lib/app.dart`) | Stateless | It only configures the MaterialApp (theme, title, home) and holds no values that mutate on screen. |
| `HomeScreen` (`lib/screens/home_screen.dart`) | Stateful | It owns and mutates two pieces of changing state: the `_checkIns` counter and the `_showLogger` boolean toggle. |
| `LifecycleLogger` (`lib/widgets/lifecycle_logger.dart`) | Stateful | It tracks and mutates its own internal `_buildCount` and must observe lifecycle callbacks across rebuilds. |
