# Chroot-Systemctl

A POSIX shell script tool suite that provides `systemd`-style service management and `SysVinit` compatibility for minimal `chroot` or container environments which lack a native init system.

## Project Introduction

In lightweight container environments (created by `chroot`, `debootstrap`, `arch-chroot`, etc.), a proper `init` system is often missing. This makes managing services difficult and breaks tools that expect a standard `systemd` or `SysVinit` interface.

The `chroot-systemctl` suite solves this problem by providing a powerful `init` script that acts as PID 1, along with a collection of wrapper and compatibility scripts to emulate a familiar Linux environment. The entire suite is written in POSIX-compliant `/bin/sh` for maximum portability.

## Core Features

* **`systemd`-like Interface**: Manage services using a `systemctl` command that wraps the `systemctl3.py` backend.
* **Intelligent Privilege Escalation**: The `systemctl` wrapper automatically handles privilege escalation via `pkexec`, `sudo`, or `su` for commands that require root access (like `start`, `stop`).
* **`SysVinit` Compatibility**: Provides familiar commands like `init`, `telinit`, `halt`, `reboot`, and `runlevel`, which are mapped to corresponding `systemd`-style actions.
* **"Unchroot" Utility**: Includes a powerful `unchroot` tool to "escape" the chroot jail and execute commands on the host system. This can also be used to create wrappers for host commands.
* **Flexible `init` Process**: Supports an override mechanism by placing an executable script at `/init`, allowing for fully custom startup procedures.
* **Pure Shell Implementation**: High portability with minimal dependencies (`coreutils`, `python3`).

## Component Overview

* **`init` / `telinit`**: The core process (PID 1) responsible for service management and dispatching `telinit` client commands.
* **`systemctl`**: A smart frontend for `systemctl3.py` that provides automatic privilege escalation.
* **`unchroot`**: A tool to "escape" the chroot and execute commands on the host, which can also act as a wrapper for any host command.
* **`runlevel`**: A compatibility script that simulates the `runlevel` command, reporting the current system state (`N 5`, `N 3`, etc.).
* **`poweroff` / `halt`**: Compatibility commands to safely shut down the services and processes within the container.

## Quick Usage Examples

*All examples are run from within the chroot environment.*

**1. Managing a Service**
```sh
# Start a service (will automatically attempt to use sudo/pkexec)
systemctl start my-app.service

# Check the service status
systemctl status my-app.service

# Stop the service
systemctl stop my-app.service
```

## License

- Files related to [android-permissions](src/android-permissions) are [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0).

- All other parts are licensed under the [EUPL-1.2](https://opensource.org/licenses/EUPL-1.2) license.