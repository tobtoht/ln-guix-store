const std = @import("std");
const linux = std.os.linux;

pub fn main() void {
    _ = linux.symlink("/app/gnu", "/gnu");

    // Qt expects certs to be here, see: qtbase/src/network/ssl/qsslsocket.cpp
    _ = linux.mkdir("/etc/ssl", 0o755);
    _ = linux.symlink("/app/profile/etc/ssl/certs", "/etc/ssl/certs");

    // Stops Qt from complaining about not running in a utf-8 locale
    _ = linux.mkdir("/run/current-system", 0o755);
    _ = linux.symlink("/app/profile/lib/locale", "/run/current-system/locale");

    // Launch Feather
    _ = linux.execve("/app/feather",
                     @ptrCast([*:null]?[*:0]u8, std.os.argv[0..].ptr),
                     @ptrCast([*:null]?[*:0]u8, std.os.environ.ptr));
    linux.exit(0);
}
