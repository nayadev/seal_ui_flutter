# ADR-0004 — Use Release Please for automated versioning and changelog generation

## Version

1.0.0

## Date

2026-05-02

## Status

Accepted

## Context

Seal UI follows Semantic Versioning and Conventional Commits. Manually deciding the next version, updating `pubspec.yaml`, writing a CHANGELOG entry, and creating a GitHub release for every release cycle is repetitive, error-prone, and easy to forget under time pressure. The project already enforces commit message format through `commitlint` and `husky`, meaning the information needed to derive the next version and summarise changes is already encoded in every commit. An automated tool that reads this information and produces a release pull request was the natural next step.

## Decision

We will use Release Please, maintained by Google, to automate versioning and changelog generation. Release Please is configured through `release-please-config.json` at the repository root with `release-type` set to `dart`, which teaches it to update `pubspec.yaml` and produce a `CHANGELOG.md` in the standard Keep a Changelog format. The `bump-minor-pre-major` and `bump-patch-for-minor-pre-major` options are enabled so that while the project is pre-1.0, `feat` commits bump the patch version rather than producing premature minor or major increments. The GitHub Actions workflow runs the `googleapis/release-please-action` on every push to `main`. When enough conventional commits accumulate, Release Please opens a pull request proposing the version bump and changelog. Merging that pull request triggers the action again to tag the commit and create the GitHub release.

## Consequences

**Positive:**
- Version bumps and changelog entries are derived automatically from commit history, eliminating manual bookkeeping
- The release pull request provides a review checkpoint where the proposed version and changelog can be inspected and corrected before the tag is cut
- Conventional Commits become a hard requirement with a clear payoff visible to every contributor: their commit message directly shapes the changelog entry
- GitHub Releases are created automatically with the correct tag, making the release artefact immediately visible to consumers
- Pre-1.0 version strategy (patch-only bumps) is encoded in configuration rather than in undocumented team convention

**Negative:**
- Requires strict adherence to Conventional Commits; a poorly worded commit message can result in an incorrect version bump or a useless changelog entry
- The release pull request must be reviewed and merged intentionally; leaving it open for a long time causes changelog entries to accumulate in ways that may be hard to review at once
- Release Please has limited support for monorepo scenarios that mix Dart and other package types; if the repository structure changes significantly, the configuration may need revisiting
- All automation is tied to GitHub Actions and the GitHub API; the workflow cannot be reproduced locally without mocking those integrations

The `release-please-config.json` file is the single source of truth for release strategy. The `include-component-in-tag` option is set to `false` so tags remain in the clean `vX.Y.Z` format expected by `pub.dev` and Dart tooling.
