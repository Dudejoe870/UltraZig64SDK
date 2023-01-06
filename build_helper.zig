const std = @import("std");
const Builder = std.build.Builder;

pub const target = std.zig.CrossTarget {
    .cpu_arch = .mips64,
    .cpu_model = .{ .explicit = &std.Target.mips.cpu.mips3 },
    .os_tag = .freestanding,
    .os_version_min = .{ .none = {} },
    .os_version_max = .{ .none = {} },
    .abi = .gnuabi64,
    .ofmt = .elf
};

pub fn addRomElf(b: *Builder, comptime rom_name: []const u8, root_src: []const u8) *std.build.LibExeObjStep {
    var step = b.addExecutable(rom_name ++ ".elf", root_src);
    step.setTarget(target);
    step.addPackagePath("libultrazig", "libultrazig/lib.zig");
    step.setLinkerScriptPath(std.build.FileSource.relative("rom.ld"));
    step.addCSourceFiles(&[_][]const u8 { "bootstrap/entry.S", "bootstrap/interrupt_handler.S" }, &[_][]const u8 { });
    return step;
}
