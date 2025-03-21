{
  blueprint-compiler,
  desktop-file-utils,
  fetchFromGitHub,
  lib,
  libadwaita,
  libportal-gtk4,
  meson,
  ninja,
  python3Packages,
  wrapGAppsHook4,
}:

python3Packages.buildPythonApplication rec {
  pname = "adwsteamgtk";
  version = "0.8.0";
  # built with meson, not a python format
  format = "other";

  src = fetchFromGitHub {
    owner = "Foldex";
    repo = "AdwSteamGtk";
    tag = "v${version}";
    hash = "sha256-n+BNqa+SHB1V1INHooc0VpeqZ2Dy1Byt7mrbJc2MXts=";
  };

  buildInputs = [
    libadwaita
    libportal-gtk4
  ];

  nativeBuildInputs = [
    blueprint-compiler
    desktop-file-utils
    meson
    ninja
    wrapGAppsHook4
  ];

  propagatedBuildInputs = with python3Packages; [
    packaging
    pygobject3
  ];

  meta = {
    description = "Simple Gtk wrapper for Adwaita-for-Steam";
    homepage = "https://github.com/Foldex/AdwSteamGtk";
    license = lib.licenses.gpl3Plus;
    maintainers = [ lib.maintainers.reedrw ];
    mainProgram = "adwaita-steam-gtk";
    platforms = lib.platforms.linux;
  };
}
