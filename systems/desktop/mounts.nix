{
  # Mount Media Drive
  fileSystems."/mnt/media" = {
    device = "/dev/disk/by-uuid/01DAFD6CEAD8E830";
    fsType = "ntfs-3g";
  };

  # Mount Gaming Drive
  fileSystems."/mnt/gaming" = {
    device = "/dev/disk/by-uuid/b112b4c6-d82c-444b-a533-aad16143a03f";
    fsType = "ext4";
  };
}
