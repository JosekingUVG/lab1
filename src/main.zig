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
            .{ .x = 321, .y = 335 },
            .{ .x = 288, .y = 286 },
            .{ .x = 339, .y = 251 },
            .{ .x = 374, .y = 302 },
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
            rl.Color.red,
        );

        // Rellenar poligono
        framebuffer.fillPolygon(
            polygon1,
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
