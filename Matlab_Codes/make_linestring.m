function [ linestring ] = make_linestring(vector)

% Make linestring  ('1 00001 , 2 0002 ,..., 8 00008')
% From vector ('0001,0002,0003,...,0009')
str=[];

for i=1:8
str=[str,num2str(i),' ' ,num2str(vector(i)),','];
end

linestring=str(1:length(str)-1);
end 