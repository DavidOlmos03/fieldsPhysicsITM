% Juan David Ruiz Olmos
% juanruiz309381@correo.itm.edu.co

clc;
clear;
close all;

% Función de potencial gravitacional f
% En el origen f = asinh((10.*(x) - 3)./(10.*(y)))-asinh(((10.*(x))+3)./(10.*(y)))
f = @(x,y,z) (asinh((10.*(x) - 3)./(10.*(y-1)))-asinh(((10.*(x))+3)./(10.*(y-1))))...
    +(asinh((10.*(y).*(1./2) - 3)./(10.*(x)))-asinh(((10.*(y).*(1./2))+3)./(10.*(x))))...
    +(asinh((10.*(x+0.5) - 3)./(10.*(y+1)))-asinh(((10.*(x+0.5))+3)./(10.*(y+1))))...
    +(asinh((10.*(y+0.5) - 3)./(10.*(x+1)))-asinh(((10.*(y+0.5))+3)./(10.*(x+1))));

% Creación de la malla de puntos en el espacio
x_range = linspace(-1.5, 1.5, 20);
y_range = linspace(-1.5, 1.5, 20);
z_range = linspace(-1.5, 1.5, 20);
[X, Y, Z] = meshgrid(x_range, y_range, z_range);

% Evaluación de la función de potencial en la malla de puntos
V = f(X, Y, Z);

% Cálculo del gradiente del potencial (campo gravitacional)
[gX, gY, gZ] = gradient(-V, x_range, y_range, z_range);

% Normalizar los vectores del campo gravitacional (flechas)
norm_g = sqrt(gX.^2 + gY.^2 + gZ.^2); % Calcular la norma (magnitud) de cada vector
gX_normalized = gX ./ norm_g; % Normalizar componentes en X
gY_normalized = gY ./ norm_g; % Normalizar componentes en Y
gZ_normalized = gZ ./ norm_g; % Normalizar componentes en Z

% Escalar los datos para definir el tamaño de los vectores
scale_factor = 0.5;

% Graficar los vectores del campo gravitacional con colores según el valor del potencial
figure;
h = quiver3(X, Y, Z, gX_normalized, gY_normalized, gZ_normalized, scale_factor);
hold on;
scatter3(X(:), Y(:), Z(:), 20, V(:), 'filled'); % Añadir puntos de color para la barra de colores
hold off;
axis tight;
xlabel('x');
ylabel('y');
zlabel('z');
title('Campo Gravitacional en Forma de J en 3D');
colorbar;
colormap(jet); % Escala de color