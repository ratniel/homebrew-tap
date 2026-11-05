cask "kotaeba" do
  version "0.9"
  sha256 "86117adcfd17c0704784cb07ebdc518fefedcff0b2c5d80a7bb02990bf65eefb"

  url "https://github.com/ratniel/kotaeba/releases/download/v#{version}/Kotaeba-#{version}.dmg"
  name "Kotaeba"
  desc "Local speech-to-text app"
  homepage "https://github.com/ratniel/kotaeba"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on formula: "uv"
  depends_on macos: :tahoe

  app "KotaebaApp.app"

  caveats <<~EOS
    macOS 26.2 or later is necessary.
    Release #{version} has no Developer ID signature or notarization ticket.
    macOS Gatekeeper rejects this release at first launch.
    Microphone access and Accessibility access are necessary.
    Complete runtime setup in the app before you start transcription.
    First use downloads Python packages and speech models.
  EOS
end
