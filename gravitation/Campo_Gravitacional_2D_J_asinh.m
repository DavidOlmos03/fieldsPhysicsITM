% Juan David Ruiz Olmos
% juanruiz309381@correo.itm.edu.co

clc;
clear;
close all;

% Función de potencial gravitacional f
% En el origen f = asinh((10.*(x) - 3)./(10.*(y)))-asinh(((10.*(x))+3)./(10.*(y)))
f = @(x,y) (asinh((10.*(x) - 3)./(10.*(y-1)))-asinh(((10.*(x))+3)./(10.*(y-1))))...
    +(asinh((10.*(y).*(1./2) - 3)./(10.*(x)))-asinh(((10.*(y).*(1./2))+3)./(10.*(x))))...
    +(asinh((10.*(x+0.5) - 3)./(10.*(y+1)))-asinh(((10.*(x+0.5))+3)./(10.*(y+1))))...
    +(asinh((10.*(y+0.5) - 3)./(10.*(x+1)))-asinh(((10.*(y+0.5))+3)./(10.*(x+1))));

% Definir un rango para x e y
x_range = linspace(-1.5, 1.5, 100);
y_range = linspace(-1.5, 1.5, 100);

% Malla de puntos donde se evaluará la función
[x, y] = meshgrid(x_range, y_range);

% Evaluar la función en la malla de puntos
z = f(x, y);

% Calcular el gradiente del potencial
[dx, dy] = gradient(z);

% Normalizar el gradiente para obtener un campo de direcciones uniforme (flechas)
u = -dx./sqrt(dx.^2 + dy.^2);
v = -dy./sqrt(dx.^2 + dy.^2);

% Graficar el campo de direcciones
quiver(x, y, u, v, 'b');

hold on;

% Graficar las líneas de contorno del potencial (J)
contour(x, y, z, 20, 'LineColor', 'r');

hold off;
axis tight;

% Etiquetas de la gráfica
xlabel('x');
ylabel('y');
title('Campo Gravitacional y Potencial con Forma de J');
grid on;