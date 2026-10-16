const m = @import("modules.zig");

pub fn half(a: u1, b: u1) u2 {
    const inputs = m.link2(.{ a, b });
    const sum = m.xor2(inputs);
    const carry = m.and2(inputs);

    return m.link2(.{ carry, sum });
}

pub fn full(a: u1, b: u1, cin: u1) u2 {
    const first = halfAdder(a, b);
    const s1: u1 = @truncate(first);
    const c1: u1 = @truncate(first >> 1);

    const second = halfAdder(s1, cin);
    const s2: u1 = @truncate(second);
    const c2: u1 = @truncate(second >> 1);

    const carry = m.or2(m.link2(.{ c1, c2 }));

    return m.link2(.{ carry, s2 });
}
