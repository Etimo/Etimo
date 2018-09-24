{lib, ...}:
let
  employees = lib.importJSON ./employees.json;
in {
  users = {
    mutableUsers = false;
    users = lib.mapAttrs (name: employee: {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = employee.sshKeys;
    }) employees;
  };
}
