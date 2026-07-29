# Laboratorio 1 - Relleno de Polígonos en Zig

Este proyecto corresponde al **Laboratorio 1** del curso de **Gráficas por Computadora**.

El objetivo es implementar un **rasterizador por software** utilizando **Zig** y **Raylib** únicamente para la creación de la ventana y la visualización del framebuffer. Los algoritmos de dibujo (píxeles, líneas, polígonos y relleno) son implementados manualmente.

## Requisitos

* Zig (versión compatible con el proyecto)
* Raylib (gestionado mediante `build.zig`)

## Clonar el repositorio

```bash
git clone https://github.com/JosekingUVG/lab1.git
cd lab1
```

## Ejecutar el proyecto

```bash
zig build run
```

También es posible compilar únicamente el proyecto:

```bash
zig build
```

El ejecutable se generará en:

```text
zig-out/bin/lab1
```

## Ramas del proyecto

Cada polígono desarrollado durante el laboratorio se encuentra en una rama independiente para facilitar su revisión.

* `poligono1`
* `poligono2`
* `poligono3`
* `poligono4`

Puedes cambiar de rama con:

```bash
git checkout poligono1
```

o listar todas las ramas disponibles:

```bash
git branch -a
```

También puedes acceder directamente desde:

```text
https://github.com/JosekingUVG/lab1/tree/poligono1
https://github.com/JosekingUVG/lab1/tree/poligono2
https://github.com/JosekingUVG/lab1/tree/poligono3
https://github.com/JosekingUVG/lab1/tree/poligono4
```

## Estructura del proyecto

```text
src/
├── main.zig
└── framebuffer.zig
```

* **main.zig**: define la escena y los polígonos a dibujar.
* **framebuffer.zig**: contiene la implementación del framebuffer y los algoritmos de dibujo.


## Objetivos del laboratorio

* Implementar un framebuffer propio.
* Dibujar píxeles manualmente.
* Implementar el algoritmo DDA para el dibujo de líneas.
* Dibujar polígonos a partir de sus vértices.
* Implementar el algoritmo **Scanline** para el relleno de polígonos.
* Comprender el proceso de rasterización utilizado en gráficos por computadora.
