pub const n64 = @import("lib.zig");

pub fn init() void {
    n64.io.audio_interface.init();
}
