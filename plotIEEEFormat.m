function plotIEEEFormat(dataTable, xColumn, yColumns, yUnits, yLabels)
    % Entradas:
    % - dataTable: La tabla que contiene los datos.
    % - xColumn: El nombre de la columna datetime en el eje x.
    % - yColumns: Un cell array de strings con los nombres de las columnas en el eje y.
    % - yUnits: Un cell array de strings con las unidades correspondientes a las columnas en el eje y.
    % - yLabels: Un cell array de strings con los títulos para las columnas en el eje Y.

    % Crear una figura
    figure;

    % Convertir la columna de fechas al formato datetime
    xData = datetime(dataTable.(xColumn), 'InputFormat', 'dd-MMM-yyyy HH:mm:ss');

    % Encuentra la fecha mínima y máxima
    minDate = min(xData);
    maxDate = max(xData);

    % Generar un rango de fechas para las etiquetas del eje x
    xTicks = minDate:hours(1):maxDate;  % Cambié a horas para un mejor espaciado en el eje x

    % Convertir fechas a números de días utilizando datenum
    xNumeric = datenum(xData);

    % Graficar cada columna en el eje y
    for i = 1:length(yColumns)
        subplot(length(yColumns), 1, i);
        yData = dataTable.(yColumns{i});
        plot(xNumeric, yData, 'b-', 'LineWidth', 1.5);  % Línea sólida y color azul

        % Personalización del formato IEEE con unidades y título en el eje Y
        ylabel([yColumns{i} ' (' yUnits{i} ')'], 'FontSize', 10);
        ylabel(yLabels{i}, 'FontSize', 12); % Establece el título en el eje Y
        grid on;

        % Configurar el eje x para mostrar fechas en el formato 'dd-mmm'
        datetick('x', 'dd-mmm', 'keepticks', 'keeplimits');
        xlabel('Time', 'FontSize', 10);
        xtickangle(45);  % Gira las etiquetas del eje x para mejorar la legibilidad
    end

    % Título personalizado para todos los subplots
    sgtitle('Título', 'FontSize', 12);
end
