# ADR-0001 — Use shadcn_ui as the Flutter component primitive layer

## Version

1.0.0

## Date

2026-03-07

## Status

Accepted

## Context

Seal UI needs a solid foundation for its component library rather than building UI primitives from scratch. Building custom components would require significant effort to ensure accessibility, cross-platform consistency, and visual polish. The project aims to provide a token-driven design system that can be reused across multiple applications while maintaining a consistent look and feel. Evaluating alternatives like Material, Cupertino, or custom implementations showed they either don't align with the modern aesthetic goals or would duplicate effort already solved by existing solutions. The React side of the seal ecosystem already uses shadcn/ui, establishing a precedent for consistency across platforms.

## Decision

We will use `shadcn_ui` as the Flutter component primitive layer for Seal UI. When evaluating Flutter implementations of shadcn, we found two community packages: shadcn_flutter and shadcn_ui. We chose shadcn_ui for its superior implementation quality and active community. All Seal components will be thin, token-driven wrappers over corresponding `Shad*` primitives. We will never import `package:flutter/material.dart` or `package:flutter/cupertino.dart` in library code, reserving Material imports only for example code that interacts with third-party packages requiring Material.

## Consequences

**Positive:** 
- Leverages a battle-tested, accessible component foundation
- Ensures visual consistency with the React seal ecosystem through shared design philosophy
- Reduces development time by building on existing primitives rather than reinventing UI components
- Enables strict adherence to the token-driven architecture where components consume design tokens without hardcoding values
- Maintains clean separation between Seal's token/theme layers and the underlying UI primitive layer

**Negative:**
- Introduces an external dependency that must be monitored for updates and breaking changes
- Requires developers to learn the `shadcn_ui` API in addition to Seal's conventions
- May limit flexibility when `shadcn_ui` primitives don't exactly match desired Seal component behavior (requiring wrapping with Flutter primitives like `DecoratedBox` or `ClipRRect`)
- Creates a slight abstraction layer that could potentially impact performance (though negligible in practice)

Component development now follows the pattern: identify the closest `Shad*` primitive, wrap it with a `Seal*` component, pass Seal design tokens via `context.themeTokens`, and use `context.dimension` for responsive spacing. This approach enforces the project's architectural boundaries while providing a productive development experience.