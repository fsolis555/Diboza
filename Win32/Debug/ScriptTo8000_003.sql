CREATE TRIGGER TB_DOCUMENTOSHACIENDA FOR TB_DOCUMENTOSHACIENDA ACTIVE BEFORE INSERT POSITION 0 AS
begin
  IF ((NEW.ID IS NULL) Or (New.id = 0)) THEN
      NEW.ID = GEN_ID(GEN_TB_DOCUMENTOSHACIENDA, 1); 
end;
