function [ out ] = trainVQ()


[FileName, PathName, FilterIndex] = uigetfile( ... 
    '*.wav','WAV-files (*.wav)', ... 
    'Pick a file', ... 
    'MultiSelect', 'on');


k = 8; % number of centroids required 
n = length(FileName);


for i = 1:n % train a VQ codebook for each speaker  
    file = fullfile(PathName, FileName{i});
    disp(file);
    [s, fs] = audioread(file);
    v = mfcc(s, fs); % Compute MFCCs 
    code{i} = vqlbg(v, k); % Train VQ codebook  
    
    % Reduce dimensions (20,8) --> (1,8)
    c = code(i);
    t = [c{:}];
    vector_temp(i,:) = mean(t);
end

out = mean(vector_temp);
end