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
            .{ .x = 377, .y = 249 },
            .{ .x = 411, .y = 197 },
            .{ .x = 436, .y = 249 },
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
            rl.Color.white,
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
