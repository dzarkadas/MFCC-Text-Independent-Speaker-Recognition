function [ similare ] = querry(db_table_name,conn,k)

%Output of 8 attributes mining
vector=trainVQ;

%Convert to linestring 
line_str=make_linestring(vector);

%Create and execute question
commandString = sprintf('SELECT name, genre, geom <-> ST_GeomFromText(''LINESTRING(%s)'') AS distance FROM audio_recogn.voicemap ORDER BY geom <-> ST_GeomFromText(''LINESTRING(%s)'') LIMIT %d OFFSET 0;',line_str,line_str, k);
cur = exec(conn,commandString);

%Store results for k users
row = fetch(cur, k);

similare=row.DATA;
end
