const index = @import("../index.zig");

pub const and2 = index.gate.andn(2);

pub const nand2 = index.gate.nandn(2);

pub const or2 = index.gate.orn(2);

pub const nor2 = index.gate.norn(2);

pub const xor2 = index.gate.xorn(2);

pub const xnor2 = index.gate.xnorn(2);

pub const not1 = index.gate.not;

pub const link2u1 = index.link.ulink(1, 2);
pub const link3u1 = index.link.ulink(1, 3);
pub const link4u2 = index.link.ulink(4, 2);
pub const link8d1 = index.link.dlink(8, 1);

pub const xtend4x4 = index.link.xtendn(4, 4);

pub const addr2 = index.lgc.adder.addrn(2);
pub const addr4 = index.lgc.adder.addrn(4);
pub const addr8 = index.lgc.adder.addrn(8);
pub const addr16 = index.lgc.adder.addrn(16);
