{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      blender
      freecad
      openscad
      orca-slicer
    ];
  };
}
