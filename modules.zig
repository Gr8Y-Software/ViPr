const corelib = @import("corelib.zig");

pub const and2 = corelib.bgate.andn(2);
pub const nand2 = corelib.bgate.nandn(2);
pub const or2 = corelib.bgate.orn(2);
pub const nor2 = corelib.bgate.norn(2);
pub const xor2 = corelib.bgate.xorn(2);
pub const xnor2 = corelib.bgate.xnorn(2);
pub const not1 = corelib.bgate.not;

pub const link2 = corelib.link.ulink(1, 2);
