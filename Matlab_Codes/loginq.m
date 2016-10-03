function [ loginquerry ] = loginq(username,pass,conn)

% Search in database (table : users) if username, password exist
sqlquery= sprintf(' SELECT name, pass FROM audio_recogn.users WHERE name = ''%s'' AND pass =''%s''  ;',username,pass);
e = exec(conn,sqlquery)
e = fetch(e);
close(e);

% Assign data to output variable.
loginquerry = e.Data;

% Print message if user exists or not
global log_flag;
if ( strcmp(loginquerry,'No Data'))
    loginquerry=sprintf('User does not exist.\n');
    log_flag=0;
else 
    loginquerry=sprintf('User exists. Login successful!\n');
    log_flag=1;
end

end

