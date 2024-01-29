const std = @import("std");
const ziglua = @import("ziglua");
const Lua = ziglua.Lua;
const testing = std.testing;

export fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "basic add functionality" {
    try testing.expect(add(3, 7) == 10);
}

fn adder(lua: *Lua) i32 {
    const a = lua.toInteger(1) catch 0;
    const b = lua.toInteger(2) catch 0;
    lua.pushInteger(a + b);
    return 1;
}

fn module(lua: *Lua) i32 {
    const fns = [_]ziglua.FnReg{ .{ .name = "adder", .func = ziglua.wrap(adder) }, .{ .name = "", .func = null } };
    _ = fns; // autofix

    lua.register("adder", ziglua.wrap(adder));
    return 1;
}

comptime {
    _ = ziglua.exportFn("mylib", module);
}
