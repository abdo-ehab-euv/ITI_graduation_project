
clear all;
close all;
clc;

numBytes = 127; 
bitsPerByte = 8;

% 2. Generate random bytes (integers from 0 to 255)
randomBytes = randi([0, 255], 1, numBytes);

% 3. Convert bytes to a continuous row vector of bits
% 'left-msb' ensures standard MSB-first formatting for network packets
psduBitsMatrix = de2bi(randomBytes, bitsPerByte, 'left-msb'); 

% Reshape the 127x8 matrix into a single flat row vector of 1016 bits
psduBits = reshape(psduBitsMatrix.', 1, []);

filename = 'PSDU_random2.txt';
fid = fopen(filename, 'wt');
    fprintf(fid, '%d%d%d%d%d%d%d%d\n', psduBitsMatrix.'); 
    fclose(fid);
