function updatePlot(ax, dataTable, xColumn, yColumns, startIndex, endIndex)
    % Función para actualizar el gráfico con el rango de fechas seleccionado

    % Obtiene los datos correspondientes al rango seleccionado
    xData = dataTable.(xColumn)(startIndex:endIndex);
    yData = dataTable{startIndex:endIndex, yColumns};

    % Graficar los datos
    plot(ax, xData, yData);

    % Personalización adicional del gráfico si es necesario
    xlabel(ax, xColumn, 'FontSize', 10);
    ylabel(ax, yColumns, 'FontSize', 10);
    title(ax, 'Gráfico Interactivo', 'FontSize', 12);
    grid(ax, 'on');
end