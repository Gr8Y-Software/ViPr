const std = @import("std");

pub fn Nor(comptime n: comptime_int) fn (std.meta.Int(.unsigned, n)) u1 {
    const dt = std.meta.Int(.unsigned, n);

    return struct {
        fn eval(input: dt) u1 {
            return if (input == 0) 1 else 0;
        }
    }.eval;
}
