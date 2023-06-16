const std = @import("std");
const linux = std.os.linux;

pub export fn _start() callconv(.Naked) noreturn {
    _ = linux.symlink("/app/gnu", "/gnu");
    linux.exit(0);
}
