const std = @import("std");
const debug = std.debug;
const fmt = std.fmt;

pub fn main() !void {
    const file = @embedFile("input.txt");
    var lines = std.mem.tokenizeAny(u8, file, "\n");

    var counter: u32 = 0;
    var opt_prev: ?u32 = null;
    while (lines.next()) |t0| {
        var lines_copy = lines;
        var t1 = lines_copy.next() orelse break;
        var t2 = lines_copy.next() orelse break;
        var sum = try fmt.parseInt(u32, t0, 10) +
            try fmt.parseInt(u32, t1, 10) +
            try fmt.parseInt(u32, t2, 10);

        if (opt_prev) |prev| {
            if (sum > prev)
                counter += 1;
        }

        opt_prev = sum;
    }

    debug.print("{d}\n", .{counter});
}
