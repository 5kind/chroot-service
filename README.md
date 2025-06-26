<h1 align="center">Termux Chroot Service</h1>

<div align="center">
  <!-- Version -->
    <img src="https://img.shields.io/badge/Version-v0.1.1-blue.svg?longCache=true&style=popout-square"
      alt="Version" />
  <!-- Last Updated -->
    <img src="https://img.shields.io/badge/Updated-6.24 2025-green.svg?longCache=true&style=flat-square"
      alt="_time_stamp_" />
  <!-- Min Magisk -->
    <img src="https://img.shields.io/badge/MinMagisk-27.0-red.svg?longCache=true&style=flat-square"
      alt="_time_stamp_" />
  <!-- Min KSU -->
    <img src="https://img.shields.io/badge/MinKernelSU-0.9.5-red.svg?longCache=true&style=flat-square"
      alt="_time_stamp_" /></div>

<div align="center">
  <strong>Running chroot containers on Android devices.
    <h3><a href="https://github.com/5kind/chroot-service/wiki">Wiki</a></h3><h4>⚠ Still in early development ⚠</h4>
</div>

<div align="center">
  <h3>
    <a href="https://github.com/5kind/chroot-service">
      Source Code
    </a>
  </h3>
</div>

### Usage
- Install Termux, upgrade all packages,
- Install `mount-utils`, `runit` in termux
- Run `chroot-service create <container-name>` to create a new container skel,
- Install rootfs to `/data/adb/chroot-service/<container-name>/rootfs`
- Then follow instructions in [Wiki](https://github.com/5kind/chroot-service/wiki). (Still work in progress)
