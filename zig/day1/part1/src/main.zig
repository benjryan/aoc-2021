const std = @import("std");

pub fn main() !void {
    const file = @embedFile("input.txt");
    var lines = std.mem.tokenize(u8, file, "\n");

    var counter: u32 = 0;
    var opt_prev: ?u32 = null;
    while (lines.next()) |line| {
        var x = try std.fmt.parseInt(u32, line, 10);
        if (opt_prev) |prev| {
            if (x > prev)
                counter += 1;
        }

        opt_prev = x;
    }

    std.debug.print("{d}\n", .{counter});
}
