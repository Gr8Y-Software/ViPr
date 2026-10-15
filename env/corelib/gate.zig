const std = @import("std");

pub fn andn(comptime n: comptime_int) fn (std.meta.Int(.unsigned, n)) u1 {
    const dt = std.meta.Int(.unsigned, n);

    return struct {
        fn eval(input: dt) u1 {
            return if (input == std.math.maxInt(dt)) 1 else 0;
        }
    }.eval;
}

pub fn nandn(comptime n: comptime_int) fn (std.meta.Int(.unsigned, n)) u1 {
    const dt = std.meta.Int(.unsigned, n);

    return struct {
        fn eval(input: dt) u1 {
            return if (input == std.math.maxInt(dt)) 0 else 1;
        }
    }.eval;
}

pub fn orn(comptime n: comptime_int) fn (std.meta.Int(.unsigned, n)) u1 {
    const dt = std.meta.Int(.unsigned, n);

    return struct {
        fn eval(input: dt) u1 {
            return if (input == 0) 0 else 1;
        }
    }.eval;
}

pub fn norn(comptime n: comptime_int) fn (std.meta.Int(.unsigned, n)) u1 {
    const dt = std.meta.Int(.unsigned, n);

    return struct {
        fn eval(input: dt) u1 {
            return if (input == 0) 1 else 0;
        }
    }.eval;
}

pub fn xorn(comptime n: comptime_int) fn (std.meta.Int(.unsigned, n)) u1 {
    const dt = std.meta.Int(.unsigned, n);

    return struct {
        fn eval(input: dt) u1 {
            return @intCast(@popCount(input) & 1);
        }
    }.eval;
}

pub fn xnorn(comptime n: comptime_int) fn (std.meta.Int(.unsigned, n)) u1 {
    const dt = std.meta.Int(.unsigned, n);

    return struct {
        fn eval(input: dt) u1 {
            return @intCast((@popCount(input) & 1) ^ 1);
        }
    }.eval;
}

pub fn not(input: u1) u1 {
    return ~input;
}
