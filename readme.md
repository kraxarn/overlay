My modified/updated packages.
Should probably be merged upstream, but I'm still learning how all this works

## Sources

* https://codeberg.org/gentoo/guru
* https://codeberg.org/gentoo/gentoo
* https://codeberg.org/librewolf/gentoo

## Changes

### media-gfx/blender

* Updated to the latest version.
* Added sse2neon for improved arm64 support.
* Updated some eigen3 calls.

### media-gfx/openvdb

* Updated to the latest version.

### media-sound/furnace

* Updated to the latest version.
* Fixed some int definitions.

### net-im/telegram-desktop

* Updated to the latest version (also fixes [#974483](https://bugs.gentoo.org/974483)).
* Fixed some zlib issues in more recent versions.

### www-client/librewolf

* Restored some Firefox "Kit" branding, at least until LibreWolf provides their own (I just think it's too cute to remove).
