const rl = @import("raylib");
const fb = @import("framebuffer.zig");

pub fn main() !void {
    // -----------------------------------------
    // Configuración
    // -----------------------------------------

    const screenWidth = 800;
    const screenHeight = 600;

    rl.initWindow(
        screenWidth,
        screenHeight,
        "Laboratorio 1 - Poligonos",
    );
    defer rl.closeWindow();

    rl.setTargetFPS(60);

    var framebuffer =
        fb.Framebuffer.init(
            screenWidth,
            screenHeight,
            rl.Color.black,
        );
    defer framebuffer.deinit();

    // -----------------------------------------
    // Polígono
    // -----------------------------------------

    const polygon1 = fb.Polygon{
        .vertices = &[_]fb.Vec2{
            .{ .x = 413, .y = 177 },
            .{ .x = 448, .y = 159 },
            .{ .x = 502, .y = 88 },
            .{ .x = 553, .y = 53 },
            .{ .x = 535, .y = 36 },
            .{ .x = 676, .y = 37 },
            .{ .x = 660, .y = 52 },
            .{ .x = 750, .y = 145 },
            .{ .x = 761, .y = 179 },
            .{ .x = 672, .y = 192 },
            .{ .x = 659, .y = 214 },
            .{ .x = 615, .y = 214 },
            .{ .x = 632, .y = 230 },
            .{ .x = 580, .y = 230 },
            .{ .x = 597, .y = 215 },
            .{ .x = 552, .y = 214 },
            .{ .x = 517, .y = 144 },
            .{ .x = 466, .y = 180 },
        },
    };

    const polygon2 = fb.Polygon{
        .vertices = &[_]fb.Vec2{
            .{ .x = 682, .y = 175 },
            .{ .x = 708, .y = 120 },
            .{ .x = 735, .y = 148 },
            .{ .x = 739, .y = 170 },
        },
    };

    // -----------------------------------------
    // Bucle principal
    // -----------------------------------------

    while (!rl.windowShouldClose()) {

        // Limpiar framebuffer
        framebuffer.clear();

        // Dibujar polígono
        framebuffer.drawPolygon(
            polygon1,
            rl.Color.blue,
        );

        framebuffer.drawPolygon(
            polygon2,
            rl.Color.red,
        );

        // Convertir Image -> Texture
        try framebuffer.swap();

        // Mostrar en pantalla
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(rl.Color.white);

        framebuffer.render();
    }
}
