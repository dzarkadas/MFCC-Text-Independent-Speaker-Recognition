function [ curs ] =new_profile( profile_name,male,conn, db_table_name )

%Output of 8 attributes mining
vector = trainVQ;

%Convert to linestring  
line_str=make_linestring(vector);

%Insert linestring in database (table : voicemap)
commandString = sprintf('INSERT INTO %s VALUES (''%s'',''%s'','' LINESTRING(%s)'');',db_table_name, profile_name, male, line_str );
curs = exec(conn,commandString);

%Correctness check and messages print
if( ~ isempty(curs.Message) )
    fprintf('%s\n',curs.Message);
else
    fprintf('Profile created successfully!\n');
end

end

