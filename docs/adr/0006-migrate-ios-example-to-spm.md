# ADR-0006 — Migrate example/ios from CocoaPods to Swift Package Manager

## Version

1.0.0

## Date

2026-05-23

## Status

Accepted

## Context

The `example/` app is the reference implementation and Widgetbook catalog for Seal UI. Its iOS target historically used CocoaPods as the dependency manager, which is the default for Flutter-generated projects.

Starting with Flutter 3.x, the toolchain introduced native Swift Package Manager (SPM) support for iOS plugins. When all Flutter plugins in a project provide SPM-compatible packages, Flutter generates a `FlutterGeneratedPluginSwiftPackage` under `ios/Flutter/ephemeral/Packages/` and wires it into the Xcode project as a local Swift package reference. At that point CocoaPods becomes a vestigial layer: it no longer resolves any plugin — it only carries the Flutter framework pod itself — while adding build overhead and a parallel dependency graph that duplicates work already done by SPM.

In this project, `url_launcher_ios` (the only iOS plugin in use) already ships as a Swift Package. The `FlutterGeneratedPluginSwiftPackage` is generated and referenced in `Runner.xcodeproj` via `XCLocalSwiftPackageReference`. Flutter itself warns at build time that CocoaPods integration is redundant and recommends its removal.

Keeping CocoaPods alongside SPM introduces unnecessary friction: longer build times due to the pod install step, two lockfiles to maintain, and a `Pods/` directory that must be tracked or gitignored. The divergence between what CocoaPods resolves and what SPM resolves will only grow as more plugins adopt SPM.

## Decision

We will remove CocoaPods integration from `example/ios/` entirely and rely exclusively on Swift Package Manager via Flutter's native SPM toolchain.

The removal consists of:

1. Running `pod deintegrate` inside `example/ios/` to clean up Xcode project references injected by CocoaPods.
2. Deleting `Podfile`, `Podfile.lock`, and the `Pods/` directory.
3. Removing the `#include?` directives that point to Pods xcconfig files from `Flutter/Debug.xcconfig` and `Flutter/Release.xcconfig`.
4. Updating `Runner.xcworkspace/contents.xcworkspacedata` to remove the `Pods/Pods.xcodeproj` file reference, leaving only `Runner.xcodeproj` in the workspace.

After this change, the SPM dependency chain is:

```
Runner.xcodeproj
└── XCLocalSwiftPackageReference: FlutterGeneratedPluginSwiftPackage
    ├── url_launcher_ios (Swift Package)
    └── FlutterFramework (Swift Package)
```

This is entirely managed by the Flutter toolchain on each `flutter pub get` run — no manual intervention required.

## Consequences

**Positive:**

- Eliminates the `pod install` step from the build pipeline, reducing iOS build times.
- Removes the `Pods/` directory and its lockfile, simplifying the repository and reducing noise in diffs.
- Aligns the project with Flutter's recommended iOS dependency strategy for projects where all plugins support SPM.
- Single source of truth for iOS dependencies: `pubspec.yaml` → Flutter toolchain → SPM. No parallel CocoaPods graph.
- Developers no longer need CocoaPods installed locally to build the example app.

**Negative:**

- Requires Flutter 3.x or later. Older Flutter versions that do not support SPM integration will not be able to build the example app without re-adding CocoaPods. This is acceptable given `pubspec.yaml` already constrains `flutter: ">=3.29.0"`.
- If a future plugin dependency does not yet support SPM, CocoaPods would need to be reintroduced for that plugin. This is tracked by the Flutter community and is increasingly rare.

The `Runner.xcodeproj` retains the `FlutterGeneratedPluginSwiftPackage` local package reference that Flutter regenerates on each `flutter pub get`, so the SPM wiring is maintenance-free.
