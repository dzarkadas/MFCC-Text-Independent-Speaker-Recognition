function [ conn ] = postgre_configure(database_name, username, pass)

conn = database(database_name, username, pass, 'org.postgredql.Driver', 'jdbc:postgresql://localhost:5432/');

if( ~ isempty(conn.Message) )
    fprintf('%s\n',conn.Message);
else
    fprintf('Connection to database successful!\n');
end
end