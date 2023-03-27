CREATE VIEW v_ReporteAsignacionesSemanal AS
SELECT S.Dia, S.Fecha, SUM(S.Asignaciones) AS Asignaciones FROM(
	SELECT DATENAME(WEEKDAY, DATEADD(wk, DATEDIFF(wk,0,GETDATE()), -1)) AS Dia, DATEADD(dd, 0, DATEDIFF(dd, 0, DATEADD(wk, DATEDIFF(wk,0,GETDATE()), -1))) AS Fecha, 0 AS Asignaciones
	UNION
	SELECT DATENAME(WEEKDAY, DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 0)) AS Dia, DATEADD(dd, 0, DATEDIFF(dd, 0, DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 0))) AS Fecha, 0 AS Asignaciones
	UNION
	SELECT DATENAME(WEEKDAY, DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 1)) AS Dia, DATEADD(dd, 0, DATEDIFF(dd, 0, DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 1))) AS Fecha, 0 AS Asignaciones
	UNION
	SELECT DATENAME(WEEKDAY, DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 2)) AS Dia, DATEADD(dd, 0, DATEDIFF(dd, 0, DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 2))) AS Fecha, 0 AS Asignaciones
	UNION
	SELECT DATENAME(WEEKDAY, DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 3)) AS Dia, DATEADD(dd, 0, DATEDIFF(dd, 0, DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 3))) AS Fecha, 0 AS Asignaciones
	UNION
	SELECT DATENAME(WEEKDAY, DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 4)) AS Dia, DATEADD(dd, 0, DATEDIFF(dd, 0, DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 4))) AS Fecha, 0 AS Asignaciones
	UNION
	SELECT DATENAME(WEEKDAY, DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 5)) AS Dia, DATEADD(dd, 0, DATEDIFF(dd, 0, DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 5))) AS Fecha, 0 AS Asignaciones
	UNION
	SELECT DATENAME(WEEKDAY, FechaVigente) AS Dia, DATEADD(dd, 0, DATEDIFF(dd, 0, FechaVigente)) AS Fecha, COUNT(*) AS Asignaciones
	FROM InventarioEmpleados
	WHERE DATEADD(dd, 0, DATEDIFF(dd, 0, FechaVigente)) >= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), -1) -- Sunday
	AND DATEADD(dd, 0, DATEDIFF(dd, 0, FechaVigente)) <= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 5) -- Saturday
	GROUP BY DATEADD(dd, 0, DATEDIFF(dd, 0, FechaVigente)), DATENAME(WEEKDAY, FechaVigente)
) AS S
GROUP BY S.Fecha, S.Dia
--ORDER BY S.Fecha

SELECT * FROM v_ReporteAsignacionesSemanal ORDER BY Fecha
