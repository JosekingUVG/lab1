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
            .{ .x = 165, .y = 380 },
            .{ .x = 185, .y = 360 },
            .{ .x = 180, .y = 330 },
            .{ .x = 207, .y = 345 },
            .{ .x = 233, .y = 330 },
            .{ .x = 230, .y = 360 },
            .{ .x = 250, .y = 380 },
            .{ .x = 220, .y = 385 },
            .{ .x = 205, .y = 410 },
            .{ .x = 193, .y = 383 },
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

        // Rellenar poligono
        framebuffer.fillPolygon(
            polygon1,
            rl.Color.blue,
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
