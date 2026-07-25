const rl = @import("raylib");

/// ======================
/// Tipos geométricos
/// ======================
pub const Vec2 = struct {
    x: i32,
    y: i32,
};

pub const Polygon = struct {
    vertices: []const Vec2,
};

/// ======================
/// Framebuffer
/// ======================
pub const Framebuffer = struct {
    width: i32,
    height: i32,

    image: rl.Image,
    texture: ?rl.Texture,

    background_color: rl.Color,

    /// Constructor
    pub fn init(width: i32, height: i32, background: rl.Color) Framebuffer {
        return .{
            .width = width,
            .height = height,
            .image = rl.genImageColor(width, height, background),
            .texture = null,
            .background_color = background,
        };
    }

    /// Liberar memoria
    pub fn deinit(self: *Framebuffer) void {
        if (self.texture) |texture| {
            rl.unloadTexture(texture);
        }

        rl.unloadImage(self.image);
    }

    /// Borra completamente el framebuffer
    pub fn clear(self: *Framebuffer) void {
        self.image.clearBackground(self.background_color);

        if (self.texture) |texture| {
            rl.unloadTexture(texture);
        }

        self.texture = null;
    }

    /// Dibuja un único pixel
    pub fn drawPixel(
        self: *Framebuffer,
        point: Vec2,
        color: rl.Color,
    ) void {
        if (point.x < 0 or point.y < 0)
            return;

        if (point.x >= self.width or point.y >= self.height)
            return;

        self.image.drawPixel(
            point.x,
            point.y,
            color,
        );
    }

    /// Dibuja una línea entre dos puntos
    pub fn drawLine(
        self: *Framebuffer,
        start: Vec2,
        end: Vec2,
        color: rl.Color,
    ) void {
        const dx: f32 = @floatFromInt(end.x - start.x);
        const dy: f32 = @floatFromInt(end.y - start.y);

        const absDx = @abs(dx);
        const absDy = @abs(dy);

        const steps: i32 = @intFromFloat(@max(absDx, absDy));

        // Caso especial:
        if (steps == 0) {
            self.drawPixel(start, color);
            return;
        }

        const xIncrement = dx / @as(f32, @floatFromInt(steps));
        const yIncrement = dy / @as(f32, @floatFromInt(steps));

        var x: f32 = @floatFromInt(start.x);
        var y: f32 = @floatFromInt(start.y);

        var i: i32 = 0;

        while (i <= steps) : (i += 1) {
            self.drawPixel(
                .{
                    .x = @intFromFloat(@round(x)),
                    .y = @intFromFloat(@round(y)),
                },
                color,
            );

            x += xIncrement;
            y += yIncrement;
        }
    }

    /// Dibuja únicamente el contorno del polígono
    pub fn drawPolygon(
        self: *Framebuffer,
        polygon: Polygon,
        color: rl.Color,
    ) void {
        if (polygon.vertices.len < 2)
            return;

        for (polygon.vertices, 0..) |current, i| {
            const next =
                polygon.vertices[(i + 1) % polygon.vertices.len];

            self.drawLine(
                current,
                next,
                color,
            );
        }
    }

    /// Convierte la imagen en textura
    pub fn swap(self: *Framebuffer) !void {
        if (self.texture) |texture| {
            rl.unloadTexture(texture);
        }

        self.texture =
            try rl.loadTextureFromImage(self.image);
    }

    /// Muestra el framebuffer en pantalla
    pub fn render(self: *Framebuffer) void {
        if (self.texture) |texture| {
            rl.drawTexture(
                texture,
                0,
                0,
                rl.Color.white,
            );
        }
    }
};
