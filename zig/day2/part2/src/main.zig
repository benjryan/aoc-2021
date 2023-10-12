const std = @import("std");
const fmt = std.fmt;
const mem = std.mem;

const forward = "forward";
const up = "up";
const down = "down";

pub fn main() !void {
    const file = @embedFile("input.txt");
    var lines = std.mem.tokenize(u8, file, "\n");

    var horizontal: u32 = 0;
    var depth: u32 = 0;
    var aim: u32 = 0;
    while (lines.next()) |line| {
        var params = std.mem.tokenize(u8, line, " ");
        if (params.next()) |command| {
            if (params.next()) |offset_string| {
                var offset = try fmt.parseInt(u32, offset_string, 10);
                if (mem.eql(u8, command, forward)) {
                    horizontal += offset;
                    depth += aim * offset;
                } else if (mem.eql(u8, command, up)) {
                    aim -= offset;
                } else if (mem.eql(u8, command, down)) {
                    aim += offset;
                }
            }
        }
    }

    std.debug.print("{d}\n", .{horizontal * depth});
}
