function [ similare2 ] = querry0(db_table_name,conn, cond, sel1, sel2, sel3)

%Create and execute question
if (isempty(sel1)+isempty(sel2)+isempty(sel3)==2)
    if ((isempty(sel1))&&(isempty(sel2)))
        commandString = sprintf('SELECT %s FROM audio_recogn.voicemap WHERE %s',sel3, cond);
        cur = exec(conn,commandString);
    elseif ((isempty(sel1))&&(isempty(sel3)))
        commandString = sprintf('SELECT %s FROM audio_recogn.voicemap WHERE %s',sel2, cond);
        cur = exec(conn,commandString);
    elseif ((isempty(sel2))&&(isempty(sel3)))
        commandString = sprintf('SELECT %s FROM audio_recogn.voicemap WHERE %s',sel1, cond);
        cur = exec(conn,commandString);
    end
elseif (isempty(sel1)+isempty(sel2)+isempty(sel3)==1)
    if (isempty(sel1))
        commandString = sprintf('SELECT %s, %s FROM audio_recogn.voicemap WHERE %s',sel2, sel3, cond);
        cur = exec(conn,commandString);
    elseif (isempty(sel2))
        commandString = sprintf('SELECT %s, %s FROM audio_recogn.voicemap WHERE %s',sel1, sel3, cond);
        cur = exec(conn,commandString);
    elseif (isempty(sel3))
        commandString = sprintf('SELECT %s, %s FROM audio_recogn.voicemap WHERE %s',sel1, sel2, cond);
        cur = exec(conn,commandString);
    end
elseif (isempty(sel1)+isempty(sel2)+isempty(sel3)==0)
    commandString = sprintf('SELECT %s, %s, %s FROM audio_recogn.voicemap WHERE %s',sel1, sel2, sel3, cond);
    cur = exec(conn,commandString);
end

row = fetch(cur);

similare2=row.DATA;
end