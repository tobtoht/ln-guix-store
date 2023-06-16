### ln-guix-store

Tiny zig program to symlink /app/gnu to /gnu for use inside a Flatpak.

```bash
$ zig build-exe ln-guix-store.zig -OReleaseSmall
$ stat -c %s ln-guix-store
696 (bytes)
```