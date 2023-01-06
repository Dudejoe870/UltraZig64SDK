pub const TvType = enum(u32) {
    Pal = 0,
    Ntsc = 1,
    MPal = 2
};
pub var tv_type: TvType = .Pal;

export fn __systemInit() void {
    tv_type = @intToPtr(*const TvType, 0x80000300).*;
}
