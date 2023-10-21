function interactiveDatetimePlot(dataTable, xColumn, yColumns)
    % Entradas:
    % - dataTable: La tabla que contiene los datos.
    % - xColumn: El nombre de la columna datetime en el eje x.
    % - yColumns: Un cell array de strings con los nombres de las columnas en el eje y.

    % Crear una figura interactiva
    f = uifigure('Name', 'Gráfico Interactivo', 'Position', [100, 100, 800, 600]);

    % Crear un eje interactivo
    ax = uiaxes(f, 'Position', [50, 100, 700, 400]);

    % Crear controles deslizantes para el rango de fechas de inicio y fin
    startSlider = uislider(f, 'Position', [50, 50, 700, 3]);
    startSlider.Limits = [1, height(dataTable)];  % Establece los límites para el control deslizante de inicio
    startSlider.MajorTicks = [1, height(dataTable)];  % Define las marcas principales en el control deslizante de inicio
    startSlider.Value = 1;  % Valor inicial para el control deslizante de inicio

    endSlider = uislider(f, 'Position', [50, 20, 700, 3]);
    endSlider.Limits = [1, height(dataTable)];  % Establece los límites para el control deslizante de fin
    endSlider.MajorTicks = [1, height(dataTable)];  % Define las marcas principales en el control deslizante de fin
    endSlider.Value = height(dataTable);  % Valor inicial para el control deslizante de fin

    % Crear un botón para actualizar el gráfico
    updateButton = uibutton(f, 'Position', [50, 5, 100, 25], 'Text', 'Actualizar', 'ButtonPushedFcn', @(btn, event) updatePlot(ax, dataTable, xColumn, yColumns, startSlider.Value, endSlider.Value));

    % Inicializa el gráfico con el rango completo
    updatePlot(ax, dataTable, xColumn, yColumns, startSlider.Value, endSlider.Value);
end


