// Kept in sync with inthandler.S
pub const RegBlock = extern struct {
    gpr: [32]u64,
    hi: u64,
    lo: u64,
    sr: u32,
    cr: u32,
    epc: u32,
    fc31: u32,
    fpr: [32]u64
};

pub const ExceptionInfo = struct {
    regs: *RegBlock,

    inline fn create(regs: *RegBlock) ExceptionInfo {
        return .{
            .regs = regs
        };
    }
};

var exception_handler: *const fn(ExceptionInfo) void = defaultExceptionHandler;

fn defaultExceptionHandler(exception: ExceptionInfo) void {
    _ = exception;
    while (true) {
    }
}

pub export fn __onCriticalException(regs: *RegBlock) void {
    exception_handler(ExceptionInfo.create(regs));
}

pub export fn __onResetException(regs: *RegBlock) void {
    _ = regs;
}
