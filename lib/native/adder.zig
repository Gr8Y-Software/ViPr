const std = @import("std");

fn U(comptime n: u16) type {
    return std.meta.Int(.unsigned, n);
}

pub fn half(inputs: u2) u2 {
    const a: u1 = @truncate(inputs >> 1);
    const b: u1 = @truncate(inputs);

    return @as(u2, a) + b;
}

pub fn full(inputs: u3) u2 {
    const a: u1 = @truncate(inputs >> 2);
    const b: u1 = @truncate(inputs >> 1);
    const cin: u1 = @truncate(inputs);

    return @as(u2, a) + b + cin;
}

pub fn addrn(comptime w: u16) fn (U(2 * w + 1)) U(w + 1) {
    const in_t = U(2 * w + 1);
    const out_t = U(w + 1);
    const w_t = U(w);

    return struct {
        fn eval(inputs: in_t) out_t {
            const a: w_t = @truncate(inputs >> @intCast(w + 1));
            const b: w_t = @truncate(inputs >> 1);
            const cin: u1 = @truncate(inputs);

            return @as(out_t, a) + b + cin;
        }
    }.eval;
}
