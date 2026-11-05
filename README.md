# Homebrew Tap

This repository supplies the Homebrew cask for [Kotaeba](https://github.com/ratniel/kotaeba).
The cask installs the latest published release, version 0.9.

## Requirements

- An Apple Silicon Mac
- macOS 26.2 or later
- [Homebrew](https://brew.sh/)
- An internet connection for runtime setup and model downloads

## Install

Run this command:

```bash
brew install --cask ratniel/tap/kotaeba
```

Homebrew installs `uv` as a dependency.
Homebrew installs `KotaebaApp.app` in `/Applications`.

Version 0.9 has no Developer ID signature or notarization ticket.
macOS Gatekeeper rejects this release at first launch.
A signed and notarized release is necessary for normal first launch.
This cask does not remove quarantine attributes or change macOS security settings.

After the app opens, complete runtime setup in the app.
Give the app microphone access and Accessibility access when requested.
First use downloads Python packages and speech models.

## Upgrade

Run these commands after the cask receives a new version:

```bash
brew update
brew upgrade --cask ratniel/tap/kotaeba
```

## Uninstall

Run this command:

```bash
brew uninstall --cask ratniel/tap/kotaeba
```

This command keeps app settings, transcription history, the Python runtime, and downloaded models.

## Maintain the cask

1. Publish a versioned DMG and its SHA-256 file in the [Kotaeba releases](https://github.com/ratniel/kotaeba/releases).
2. Do a checksum check of the downloaded DMG with `shasum -a 256`.
3. Update `version` and `sha256` in `Casks/kotaeba.rb`.
4. Do the checks below.
5. Commit the cask change.
6. Push the commit to `main`.

```bash
brew style --cask ratniel/tap/kotaeba
brew audit --cask --online ratniel/tap/kotaeba
brew livecheck --cask ratniel/tap/kotaeba
```

Keep published DMGs unchanged.
Use a new version for each changed DMG.
The `livecheck` command detects a newer release.
It does not update the cask.

Before each release, do an installation check on a clean Mac.
Do checks of runtime setup, model download, microphone access, Accessibility access, and transcription.
Do checks of Developer ID signing and notarization before you publish a replacement for version 0.9.
