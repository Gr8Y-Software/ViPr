const std = @import("std");

fn U(comptime n: u16) type {
    return std.meta.Int(.unsigned, n);
}

pub fn ulink(
    comptime a: comptime_int,
    comptime n: comptime_int,
) fn ([n]std.meta.Int(.unsigned, a)) std.meta.Int(.unsigned, a * n) {
    const input_type = std.meta.Int(.unsigned, a);
    const output_type = std.meta.Int(.unsigned, a * n);

    return struct {
        fn eval(inputs: [n]input_type) output_type {
            var result: output_type = 0;

            inline for (inputs, 0..) |input, i| {
                result |= @as(output_type, input) << @intCast(a * (n - 1 - i));
            }

            return result;
        }
    }.eval;
}

pub fn dlink(comptime a: u16, comptime b: u16) fn (U(a), U(b)) U(a + b) {
    const out_t = U(a + b);

    return struct {
        fn eval(x: U(a), y: U(b)) out_t {
            return (@as(out_t, x) << @intCast(b)) | @as(out_t, y);
        }
    }.eval;
}

pub fn xtendn(comptime n: u16, comptime z: u16) fn (U(n)) U(n + z) {
    return struct {
        fn eval(x: U(n)) U(n + z) {
            return x;
        }
    }.eval;
}
