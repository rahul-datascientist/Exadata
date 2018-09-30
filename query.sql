set serveroutput on

DECLARE
 blkcnt_cmp   PLS_INTEGER;
 blkcnt_uncmp PLS_INTEGER;
 row_comp     PLS_INTEGER;
 row_uncmp    PLS_INTEGER;
 cmp_ratio    NUMBER;
 comptype     VARCHAR2(30);
BEGIN
  dbms_compression.get_compression_ratio('SYSTEM', 'SYS', 'SOURCE$', NULL, dbms_compression.comp_advanced, blkcnt_cmp, blkcnt_uncmp, row_comp, row_uncmp, cmp_ratio, comptype);

  dbms_output.put_line('Block Count Compressed:   ' || TO_CHAR(blkcnt_cmp));
  dbms_output.put_line('Block Count UnCompressed: ' || TO_CHAR(blkcnt_uncmp));
  dbms_output.put_line('Row Count Compressed:     ' || TO_CHAR(row_comp));
  dbms_output.put_line('Row Count UnCompressed:   ' || TO_CHAR(row_uncmp));
  dbms_output.put_line('Block Count Compressed:   ' || TO_CHAR(cmp_ratio));
  dbms_output.put_line('Compression Type:         ' || comptype);
END;
/