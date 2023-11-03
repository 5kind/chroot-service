<h1 align="center">Systemless Chroot Service</h1>

<div align="center">
  <!-- Version -->
    <img src="https://img.shields.io/badge/Version-v1.0-blue.svg?longCache=true&style=popout-square"
      alt="Version" />
  <!-- Last Updated -->
    <img src="https://img.shields.io/badge/Updated-September 11, 2023-green.svg?longCache=true&style=flat-square"
      alt="_time_stamp_" />
  <!-- Min Magisk -->
    <img src="https://img.shields.io/badge/MinMagisk-20.4-red.svg?longCache=true&style=flat-square"
      alt="_time_stamp_" />
  <!-- Min KSU -->
    <img src="https://img.shields.io/badge/MinKernelSU-0.6.6-red.svg?longCache=true&style=flat-square"
      alt="_time_stamp_" /></div>

<div align="center">
  <strong>Systemless Chroot Service provide chroot service support and others scripts, still in early development.
</div>

<div align="center">
  <h3>
    <a href="https://github.com/5kind/termux-arch-chroot">
      Source Code
    </a>
    <span>
  </h3>
</div>

## Boot scripts
next scripts in /etc/chroot-service will be run after boot.
- profile.d/*.sh
- post-fs-data.d/*.sh
- service.d/*.sh
- boot-completed.d/*.sh