const corelib = @import("corelib.zig");

pub const and2 = corelib.gate.andn(2);
pub const nand2 = corelib.gate.nandn(2);
pub const or2 = corelib.gate.orn(2);
pub const nor2 = corelib.gate.norn(2);
pub const xor2 = corelib.gate.xorn(2);
pub const xnor2 = corelib.gate.xnorn(2);
pub const not1 = corelib.gate.not;

pub const link2 = corelib.link.ulink(1, 2);
