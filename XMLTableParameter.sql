


ALTER PROCEDURE [dbo].[st_SelXMLTest]
	@xmlData XML 
AS
BEGIN

/*
DECLARE @xmlData XML = '<ResultSet1><Record1><Interface>INTER-099</Interface><Process>Proceso DEMO</Process><Type>INFO</Type><Message>PRUEBA</Message><Params></Params><Response/></Record1></ResultSet1>'
*/

 SELECT
(ROW_NUMBER() OVER(ORDER BY (SELECT NULL))) AS ID,
'Datos recibidos' AS Salida,
pd.value('Interface[1]','NVARCHAR(50)') AS Interface,
pd.value('Process[1]','NVARCHAR(100)') AS Process,
pd.value('Type[1]','NVARCHAR(50)') AS [Type],
pd.value('Message[1]','VARCHAR(500)') AS [Message],
pd.value('Params[1]','VARCHAR(500)') AS Params,
pd.value('Response[1]','VARCHAR(500)') AS Response
FROM @xmlData.nodes('ResultSet1/Record1') AS i(pd)


END
