% Juan David Ruiz Olmos
% juanruiz309381@correo.itm.edu.co

clc;
clear;
close all;

% Letra S
f = @(x,y) -(log((x+0.5+sqrt((x+0.5).^2+(y-1).^2))./(x-0.5+sqrt((x-0.5).^2+(y-1).^2)))...
    +log(((1/2)*(y)+0.5+sqrt(((1/2)*(y)+0.5).^2+(x).^2))./((1/2)*(y)-0.5+sqrt(((1/2)*(y)-0.5).^2+(x).^2)))...
    +log(((-x-0.5)+0.5+sqrt(((-x-0.5)+0.5).^2+((y+2)-1).^2))./((-x-0.5)-0.5+sqrt(((-x-0.5)-0.5).^2+((y+2)-1).^2)))...
    +log(((1/2)*(y+0.5)*2+0.5+sqrt(((1/2)*(y+0.5)*2+0.5).^2+(x+1).^2))./((1/2)*(y+0.5)*2-0.5+sqrt(((1/2)*(y+0.5)*2-0.5).^2+(x+1).^2))));

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