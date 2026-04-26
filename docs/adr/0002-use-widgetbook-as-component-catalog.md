# ADR-0002 — Use Widgetbook as the Flutter component catalog

## Version

1.0.0

## Date

2026-03-07

## Status

Accepted

## Context

Seal UI needs an isolated environment for developing, testing, and documenting components at a granular level. While we have an example app that serves as a custom demo application, it doesn't provide the dedicated, organized environment needed for component-driven development. We evaluated several options for Flutter widget catalogs including Widgetbook, Dashbook, Monarch, and storybook_flutter. While Storybook is popular for web components, storybook_flutter lacks maturity and active maintenance. Dashbook and Monarch are simpler alternatives but lack advanced features like documentation addons, theme switching capabilities, and web publishing options. Widgetbook stood out for its comprehensive feature set, active community, and ability to meet all our requirements for interactive component exploration, documentation alongside use cases, and visual testing across different themes and viewports.

## Decision

We will use Widgetbook as the Flutter component catalog for Seal UI. The component catalog lives in `example/widgetbook/` with the main entry point at `example/widgetbook/widgetbook_app.dart`. Every new Seal component must include at least one Widgetbook use case with relevant knobs (string, boolean, dropdown) to enable interactive exploration. We use the `widgetbook_documentation_addon` for inline markdown documentation per use case, creating a seamless development and documentation experience. Additionally, Widgetbook offers the ability to publish the component catalog to the web via https://www.widgetbook.io/, which we plan to leverage in the future for easier sharing and collaboration.

## Consequences

**Positive:**
- Provides an isolated environment for component development and testing
- Enables visual testing across multiple themes and viewports (mobile, tablet, desktop)
- Facilitates documentation-driven development with markdown docs alongside interactive use cases
- Encourages comprehensive component coverage by requiring use cases for every new component
- Supports thematic exploration through built-in theme switching
- Organizes components into logical categories (Components, Tokens, Layout) for easy navigation

**Negative:**
- Introduces build and maintenance overhead for the Widgetbook catalog
- Requires learning Widgetbook's API in addition to Seal's conventions
- Increases repository size with documentation assets and category files
- May slow down development slightly due to the additional step of creating Widgetbook use cases
- Creates a dependency on Widgetbook's release schedule and stability

Component development now follows the pattern: after implementing a Seal component, developers create at least one Widgetbook use case in the appropriate category file, add corresponding markdown documentation in `example/assets/markdown/`, and update the example app showcase if relevant. This approach ensures components are well-documented, visually testable, and easily discoverable by consumers of the library.