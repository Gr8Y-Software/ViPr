const std = @import("std");

fn U(comptime n: u16) type {
    return std.meta.Int(.unsigned, n);
}

pub fn link(comptime a: u16, comptime b: u16) fn (U(a), U(b)) U(a + b) {
    const out_t = U(a + b);

    return struct {
        fn eval(x: U(a), y: U(b)) out_t {
            return (@as(out_t, x) << @intCast(b)) | @as(out_t, y);
        }
    }.eval;
}
