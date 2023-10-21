

fechasDatetime = datetime(Hispico_Nadir.Time, 'InputFormat', 'dd-MMM-yyyy HH:mm:ss');

% Especifica el intervalo deseado en minutos (en este caso, 10 minutos)
intervaloMinutos = 10;

% Divide las fechas en grupos según el intervalo
intervalos = floor(minutes(fechasDatetime - fechasDatetime(1)) / intervaloMinutos) + 1;

