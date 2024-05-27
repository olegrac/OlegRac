

DECLARE @PrivateBanker INT;
DECLARE @KPVCode INT;
DECLARE @KAUPCode INT;
DECLARE @FARFVPCode INT;
DECLARE @min int = 681; -- Mng code from
DECLARE @max int = 694; -- Mng code to
DECLARE @СlMin char(6) = '000004'; -- Client from
DECLARE @ClMax char(6) = '099999'; -- Clien To
declare @ClCode int;


DECLARE cursor_ClCode CURSOR
    FOR 
	SELECT [ClCode] FROM Clients where [ClCode] between @СlMin and @ClMax
OPEN cursor_ClCode
FETCH NEXT FROM cursor_ClCode
into @ClCode

WHILE @@FETCH_STATUS = 0  
BEGIN  
      SELECT	@PrivateBanker = ABS(CHECKSUM(NEWID()) % (@max-@min + 1)) + @min,
		@KPVCode = ABS(CHECKSUM(NEWID()) % (@max-@min + 1)) + @min,  
		@KAUPCode = ABS(CHECKSUM(NEWID()) % (@max-@min + 1)) + @min, 
		@FARFVPCode = ABS(CHECKSUM(NEWID()) % (@max-@min + 1)) + @min;

		update	Clients
		set		PrivateBanker = @PrivateBanker, KPVCode = @KPVCode, KAUPCode = @KAUPCode, FARFVPCode = @FARFVPCode
		where	[ClCode] = @ClCode

      FETCH NEXT FROM cursor_ClCode INTO @ClCode 
END 

CLOSE cursor_ClCode  
DEALLOCATE cursor_ClCode