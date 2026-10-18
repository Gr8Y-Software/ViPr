const std = @import("std");

fn U(comptime n: u16) type {
    return std.meta.Int(.unsigned, n);
}

pub fn rightx(comptime n: u16, comptime z: u16) fn (U(n)) U(n + z) {
    return struct {
        fn eval(x: U(n)) U(n + z) {
            return @as(U(n + z), x) << z;
        }
    }.eval;
}
