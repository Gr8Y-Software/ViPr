const std = @import("std");

pub fn Xor(comptime n: comptime_int) fn (std.meta.Int(.unsigned, n)) u1 {
    const dt = std.meta.Int(.unsigned, n);

    return struct {
        fn eval(input: dt) u1 {
            return @intCast(@popCount(input) & 1);
        }
    }.eval;
}

pub fn Xnor(comptime n: comptime_int) fn (std.meta.Int(.unsigned, n)) u1 {
    const dt = std.meta.Int(.unsigned, n);

    return struct {
        fn eval(input: dt) u1 {
            return @intCast((@popCount(input) & 1) ^ 1);
        }
    }.eval;
}
