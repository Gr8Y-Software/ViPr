// old version, wait update

const std = @import("std");
const m = @import("../_modules_.zig");

fn U(comptime n: u16) type {
    return std.meta.Int(.unsigned, n);
}

pub fn half(inputs: u2) u2 {
    const sum = m.xor2(inputs);
    const carry = m.and2(inputs);

    return m.link2u1(.{ carry, sum });
}

pub fn full(inputs: u3) u2 {
    const a: u1 = @truncate(inputs >> 2);
    const b: u1 = @truncate(inputs >> 1);
    const cin: u1 = @truncate(inputs);

    const first = half(m.link2u1(.{ a, b }));
    const s1: u1 = @truncate(first);
    const c1: u1 = @truncate(first >> 1);

    const second = half(m.link2u1(.{ s1, cin }));
    const s2: u1 = @truncate(second);
    const c2: u1 = @truncate(second >> 1);

    const carry = m.or2(m.link2u1(.{ c1, c2 }));

    return m.link2u1(.{ carry, s2 });
}

pub fn adder(comptime w: u16) fn (U(2 * w + 1)) U(w + 1) {
    const in_t = U(2 * w + 1);
    const out_t = U(w + 1);
    const w_t = U(w);

    return struct {
        fn eval(inputs: in_t) out_t {
            const a: w_t = @truncate(inputs >> @intCast(w + 1));
            const b: w_t = @truncate(inputs >> 1);
            var carry: u1 = @truncate(inputs);
            var sum: w_t = 0;

            inline for (0..w) |i| {
                const ai: u1 = @truncate(a >> @intCast(i));
                const bi: u1 = @truncate(b >> @intCast(i));
                const r = full(m.link3u1(.{ ai, bi, carry }));
                const si: u1 = @truncate(r);
                sum |= @as(w_t, si) << @intCast(i);
                carry = @truncate(r >> 1);
            }

            return (@as(out_t, carry) << @intCast(w)) | sum;
        }
    }.eval;
}
