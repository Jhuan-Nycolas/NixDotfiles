{pkgs, ...}: {
  users.users.tux = {
    isNormalUser = true;
    description = "Tux";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.nushell;
  };
}
