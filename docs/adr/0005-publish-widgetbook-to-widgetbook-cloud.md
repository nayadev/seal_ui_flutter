# ADR-0005 — Publish Widgetbook to Widgetbook Cloud

## Version

1.0.0

## Date

2026-05-03

## Status

Accepted

## Context

ADR-0002 established Widgetbook as the Flutter component catalog and explicitly noted that publishing to widgetbook.io was a planned next step. With the catalog now mature and covering all Seal UI components, the need for a shareable, always-up-to-date hosted version has become concrete: designers and consuming-app developers need to explore components and documentation without cloning the repository or running the catalog locally.

The React counterpart, `seal_ui_react`, already achieves this via Chromatic — every pull request publishes a Storybook build and a permalink is posted back to the PR. Bringing parity to the Flutter side means designers and developers working across both platforms have a consistent workflow: a live catalog URL that reflects the current state of `main` and a per-PR preview for reviewing changes before they merge.

Widgetbook Cloud is the natural hosting choice because it is purpose-built for Widgetbook projects and offers a free tier for open-source repositories. Alternatives like self-hosted static hosting (GitHub Pages, Firebase Hosting) would require additional Flutter web build pipeline work and provide no Widgetbook-aware features such as review flows or per-PR build comparisons. Chromatic, which works well for Storybook, has no Flutter integration.

## Decision

We will publish the Widgetbook catalog to Widgetbook Cloud using the free tier. A GitHub Actions workflow will build the catalog as a Flutter web app and upload it via `widgetbook_cli` on every push to `main` and on every pull request.

The upload step uses the `widgetbook cloud upload` command provided by `widgetbook_cli`, which requires a `WIDGETBOOK_API_KEY` secret stored in the repository's GitHub Actions secrets. The build target is `example/widgetbook/widgetbook_app.dart`, compiled with `flutter build web --release`.

Pull request builds are associated with their branch and commit so Widgetbook Cloud can surface per-PR previews and flag visual changes, mirroring the review workflow already in place on the React side with Chromatic.

## Consequences

**Positive:**
- Designers and consuming-app teams can explore the live component catalog without any local setup
- Every pull request produces a shareable preview URL, enabling async design review before merge
- Brings the Flutter catalog to feature parity with the React Storybook + Chromatic workflow
- The free tier covers open-source projects with no cost implications
- CI integration means the hosted catalog is never stale — it always reflects the latest state of `main`
- Widgetbook Cloud understands the Widgetbook build format natively, requiring no custom parsing or hosting logic

**Negative:**
- Introduces a dependency on Widgetbook Cloud's availability; if the service is down, upload steps fail (though this does not block merges)
- Requires a `WIDGETBOOK_API_KEY` secret to be provisioned and rotated; losing it prevents uploads until a new key is issued
- Flutter web builds add CI time (~2–3 minutes per run) compared to the existing analysis and test steps
- Free tier limits (snapshots per month, retention period) may require a plan upgrade if catalog usage grows significantly
- The open-source free tier assumes the repository remains public; moving to a private repository would require a paid plan

The `WIDGETBOOK_API_KEY` is the only new secret required. The workflow runs `flutter build web --release -t widgetbook/widgetbook_app.dart` inside the `example/` directory, then calls `dart pub global activate widgetbook_cli` followed by `widgetbook cloud upload`, passing the branch name and commit SHA so Widgetbook Cloud can correctly associate the build with its PR context.
