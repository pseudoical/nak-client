# Not a Kirka client

NaK is a featureless toy Kirka.io client for Linux written in GNU Assembly (GAS), using GTK4 and WebKitGTK 6.0.

## Requirements

- Linux (x86_64)
- glibc
- GTK4
- WebKitGTK 6.0

## Warning

This client primarily serves as an educational project rather than a full-fledged application.

A typical client includes features designed to improve the user experience.

However, NaK intentionally lacks most of these features and is nothing more than a window with a browser.

## Installation

1. Clone or download the repository.
2. If necessary, extract the archive.
3. Run the `main` executable.

## Known issues

On my system, NaK is limited to ~75 FPS despite other applications reaching my monitor's refresh rate.

For comparison, `gtk4-demo` exhibits the same behavior.

While `GDK_DEBUG=no-vsync gtk4-demo` removes the cap for GTK4 demo programs, it has no effect on NaK.

The cause is currently unknown and may be related to WebKitGTK.

## Building

### Verify dependencies

```bash
pkg-config --modversion gtk4
```

```bash
pkg-config --modversion webkitgtk-6.0
```
### Run the script

```bash
./build.sh
```

## Still having issues?

Compare your environment with the one listed below.

The client is developed and tested on:

```yaml
OS: Void Linux x86_64
Kernel: Linux 6.18.33_1
DE: Xfce4 4.20
WM: Xfwm4 (X11)
CPU: AMD Ryzen 5 3600
GPU: AMD Radeon RX 6600
```

If your setup differs significantly, compatibility issues are possible.

## Contact me

### Discord

Feel free to send me a friend request or DM!

- Username: `pseudoical`
- Profile: https://discord.com/users/1408292932624060426

## Thanks for checking out NaK

Hello, developer here!

I started this project to see if it was even possible.

In the process, I didn't always follow best practices.

I eventually got distracted by code golf and size optimization.

I'm sure it could be smaller, but I'm happy with the result.

This project is licensed under the WTFPL. See [LICENSE](LICENSE) for details.

Have a good day!