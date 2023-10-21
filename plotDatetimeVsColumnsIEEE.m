function plotDatetimeVsColumnsIEEE(dataTable, xColumn, yColumns, figureSize, xLabel, yLabels, titleFontSize, axisFontSize)
    % Entradas:
    % - dataTable: La tabla que contiene los datos.
    % - xColumn: El nombre de la columna datetime en el eje x.
    % - yColumns: Un cell array de strings con los nombres de las columnas en el eje y.
    % - figureSize: Tamaño de la figura en pulgadas (opcional).
    % - xLabel: Etiqueta para el eje x (opcional).
    % - yLabels: Cell array con etiquetas para los ejes y (opcional).
    % - titleFontSize: Tamaño de fuente para los títulos de los gráficos (opcional).
    % - axisFontSize: Tamaño de fuente para etiquetas de ejes (opcional).

    % Validación de entrada
    if ~ismember(xColumn, dataTable.Properties.VariableNames) || ~all(ismember(yColumns, dataTable.Properties.VariableNames))
        error('Nombres de columna no válidos');
    end

    % Obtener las fechas en el eje x
    xData = dataTable.(xColumn);

    % Crear una figura
    if nargin < 4
        figureSize = [3.5, 2.5];  % Tamaño predeterminado
    end
    figure('Units', 'inches', 'Position', [0, 0, figureSize(1), figureSize(2)]);

    % Graficar cada columna en el eje y
    for i = 1:length(yColumns)
        subplot(length(yColumns), 1, i);
        yData = dataTable.(yColumns{i});
        plot(xData, yData, 'b-', 'LineWidth', 1.5);  % Línea sólida y color azul

        % Personalización opcional del formato
        if nargin >= 5
            xlabel(xLabel, 'FontSize', axisFontSize);
        end
        if nargin >= 6
            ylabel(yLabels{i}, 'FontSize', axisFontSize);
        end
        if nargin >= 7
            title(yColumns{i}, 'FontSize', titleFontSize);
        end

        grid on;
    end

    % Guardar la figura en un formato compatible con LaTeX (por ejemplo, PNG o EPS)
    % saveas(gcf, 'mi_grafico.png', 'png');  % Cambia el nombre del archivo según sea necesario
end
