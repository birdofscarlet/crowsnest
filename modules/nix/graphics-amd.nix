{ config, pkgs, lib, inputs, ... }:

#------ configuration for host with AMD graphics card ------#

{

    boot.initrd.kernelModules = [ "amdgpu" ];
    hardware.amdgpu.initrd.enable = true;

    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;

    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "amdgpu" ];

}
