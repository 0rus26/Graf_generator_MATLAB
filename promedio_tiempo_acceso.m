function promedio_tiempo_acceso(timeData)
    % Inicializa una matriz para almacenar los tiempos entre accesos
    tiempos_entre_accesos = [];

    % Recorre la columna de fechas y horas desde el segundo registro en adelante
    for i = 2:length(timeData)
        % Calcula el tiempo entre el acceso actual y el acceso anterior
        tiempo_entre_accesos = timeData(i) - timeData(i-1);

        % Convierte el tiempo entre accesos a segundos (opcional)
        tiempo_entre_accesos_en_segundos = seconds(tiempo_entre_accesos);

        % Agrega el tiempo entre accesos a la matriz
        tiempos_entre_accesos = [tiempos_entre_accesos; tiempo_entre_accesos_en_segundos];
    end

    % Calcula el promedio de tiempo entre accesos
    promedio_tiempo = mean(tiempos_entre_accesos);

    % Muestra el resultado
    disp(['Promedio de tiempo entre accesos: ' char(promedio_tiempo)]);
end
