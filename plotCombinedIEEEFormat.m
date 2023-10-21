function plotCombinedIEEEFormat(dataTable, xColumn, yColumns, yUnits, yLabels)
    % Entradas:
    % - dataTable: La tabla que contiene los datos.
    % - xColumn: El nombre de la columna datetime en el eje x.
    % - yColumns: Un cell array de strings con los nombres de las columnas en el eje y.
    % - yUnits: Un cell array de strings con las unidades correspondientes a las columnas en el eje y.
    % - yLabels: Un cell array de strings con las etiquetas para las columnas en el eje Y.

    % Crear una figura
    figure;

    % Convertir la columna de fechas al formato datetime
    xData = datetime(dataTable.(xColumn), 'InputFormat', 'dd-MMM-yyyy HH:mm:ss');

    % Encuentra la fecha mínima y máxima
    minDate = min(xData);
    maxDate = max(xData);

    % Convertir fechas a números de días utilizando datenum
    xNumeric = datenum(xData);

    % Graficar todas las columnas en el mismo eje y
    hold on; % Mantén los gráficos en el mismo eje
    for i = 1:length(yColumns)
        yData = dataTable.(yColumns{i});
        plot(xNumeric, yData, 'LineWidth', 1.5, 'DisplayName', [yLabels{i} ' (' yUnits{i} ')']); % Agrega DisplayName para la leyenda
    end
    hold off; % Deja de mantener los gráficos en el mismo eje

    % Personalización del formato IEEE
    ylabel('Valor en (dB)', 'FontSize', 10); % Cambia la etiqueta del eje y según tu preferencia
    grid on;

    % Configurar el eje x para mostrar fechas en el formato 'dd-mmm'
    datetick('x', 'dd-mmm', 'keepticks', 'keeplimits');
    xlabel('Tiempo', 'FontSize', 10);
    xtickangle(45);  % Gira las etiquetas del eje x para mejorar la legibilidad

    % Agrega una leyenda para diferenciar las columnas
    legend('Location', 'Best', 'FontSize', 10);

    % Título personalizado para el gráfico combinado
    sgtitle('Gráfico Combinado IEEE', 'FontSize', 12);
end
