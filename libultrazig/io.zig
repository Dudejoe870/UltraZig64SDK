pub const std = @import("std");
pub const n64 = @import("lib.zig");

pub const AudioInterface = extern struct {
    const ntsc_dac_rate = 48681812;
    const pal_dac_rate = 49656530;
    const mpal_dac_rate = 48628316;

    address: ?*volatile anyopaque,
    length: u32,
    control: bool(u32),
    status: extern union { // Read-only, writes cause clear interrupt.
        word: u32,
        read_bits: packed struct {
            _unusued: u30,
            busy: u1,
            full: u1
        }
    },
    dac_rate: u32,
    sample_size: u32,

    pub fn init(self: *AudioInterface) void {
        self.dac_rate = switch(n64.system.tv_type.*) {
            .Ntsc => ntsc_dac_rate,
            .Pal => pal_dac_rate,
            .MPal => mpal_dac_rate
        };
    }

    pub inline fn clearInterrupt(self: *AudioInterface) void {
        self.status.word = std.math.maxInt(u32);
    }
};
pub const audio_interface = @intToPtr(*volatile AudioInterface, 0xA4500000);
