const Builder = @import("std").build.Builder;

const build_helper = @import("build_helper.zig");

pub fn build(b: *Builder) !void {
    const mode = b.standardReleaseOptions();

    const basic_elf = build_helper.addRomElf(b, "basic", "examples/basic/main.zig");
    basic_elf.setBuildMode(mode);

    basic_elf.install();
}
