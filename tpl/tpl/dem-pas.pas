//======================================================================

program dempas;
uses crt;

var fin, fex, ftr : text;
    i, j : integer;
    itemsep, line : string;
    nlines : integer;
begin
  assign(fin,'testin'); rewrite(fin);
  assign(fex,'testex'); rewrite(fex);
  assign(ftr,'testtr'); rewrite(ftr);

  writeln(fin,'# Test input file'); writeln;
  for i:=1 to 5 do
  begin
    writeln(fin,'ITEM1|ITEM2|ITEM3|ITEM4|');
  end;
  close(fin);

  itemsep := '|';
  nlines := 0;

  assign(fin,'testin'); reset(fin);
  while not EOF(fin) do
  begin
    readln(fin,line);
    for j := 1 to length(line) do
    begin
      if (line[j] = itemsep)
      then
        begin write('   '); end
      else
        begin write(line[j]); end
    end;
    writeln;
    nlines := nlines + 1
  end;

  writeln(nlines:3);

  close(fin);
  close(fex);
  close(ftr);

end.

//======================================================================
