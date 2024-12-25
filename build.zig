const std = @import("std");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize: std.builtin.OptimizeMode = .ReleaseFast;

    const run_step = b.step("run", "Run the demo");

    var exe = b.addExecutable(.{
        .name = "fftw_zig",
        .root_source_file = b.path("src/fftw_zig.zig"),
        .target = target, 
        .optimize = optimize
    });

    exe.linkSystemLibrary("fftw3");
    exe.linkLibC();

    b.installArtifact(exe);

    b.getInstallStep().dependOn(&b.addInstallArtifact(exe, .{
        .dest_dir = .{ .override = .{ .custom = "../bin"}}
    }).step);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    run_step.dependOn(&run_cmd.step);
}

