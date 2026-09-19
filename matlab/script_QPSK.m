clear all; close all; clc


%global DQPSK_input;
global TxDACbitNumber;
TxDACbitNumber = 6;
I_path = 1; Q_path = 1;
DQPSK_input_1= ((I_path +  Q_path) - j*(I_path -  Q_path))/2;
I_path = -1; Q_path = 1;
DQPSK_input_2= ((I_path +  Q_path) - j*(I_path -  Q_path))/2;
I_path = 1; Q_path = -1;
DQPSK_input_3= ((I_path +  Q_path) - j*(I_path -  Q_path))/2;
I_path = -1; Q_path = -1;
DQPSK_input_4= ((I_path +  Q_path) - j*(I_path -  Q_path))/2;


DQPSK_inputs = [DQPSK_input_1, DQPSK_input_2, DQPSK_input_3, DQPSK_input_4];

%--- Quantization ---%
DQPSK_inputs_quantized = floor ( DQPSK_inputs * (2^(TxDACbitNumber -1)-1) ) ;
%--- obtaining real and imaginary parts ---%
DQPSK_inputs_quantized_Real_tofile = real(DQPSK_inputs_quantized(1:end));
DQPSK_inputs_quantized_Imag_tofile = imag(DQPSK_inputs_quantized(1:end));
%--- Converting to Fixed Point ---%
re = fi(DQPSK_inputs_quantized_Real_tofile,1,6,0);
im = fi(DQPSK_inputs_quantized_Imag_tofile,1,6,0);
%--- Converting the Fixed Point decimal to a binary number ---%           
for n = 1 : length(DQPSK_inputs_quantized_Real_tofile)
    QPSK_bin2comreal(n,:) = bin(re(n));
    QPSK_bin2comimag(n,:) = bin(im(n));
end
%--- Writing each of the real and imaginary components to a separate file ---%
fid = fopen('QPSK_Real_tofile.txt', 'wt' );
fprintf(fid, '%c%c%c%c%c%c\n',transpose (QPSK_bin2comreal));
fclose (fid);         
fid = fopen('QPSK_Imag_tofile.txt', 'wt' );
fprintf(fid, '%c%c%c%c%c%c\n',transpose (QPSK_bin2comimag));
fclose (fid);


initial = cos(pi/4)+ (i * sin(pi/4));
%--- Quantization ---%
initial_quantized = floor ( initial * (2^(TxDACbitNumber -1)-1) ) ;
%--- Obtaining Real and Imaginary parts ---%
initial_quantized_real = real(initial_quantized);
initial_quantized_imag = imag(initial_quantized);
%--- Converting to Fixed Point ---%
re = fi(initial_quantized_real,1,6,0);
im = fi(initial_quantized_imag,1,6,0);
%--- Converting the Fixed Point decimal to a binary number ---%           
for n = 1 : length(initial_quantized_real)
    initial_bin2comreal(n,:) = bin(re(n));
    initial_bin2comimag(n,:) = bin(im(n));
end

%--- Writing each of the real and imaginary components to a separate file ---%
fid = fopen('initial_Real_tofile.txt', 'wt' );
fprintf(fid, '%c%c%c%c%c%c\n',transpose (initial_bin2comreal));
fclose (fid);         
fid = fopen('initial_Imag_tofile.txt', 'wt' );
fprintf(fid, '%c%c%c%c%c%c\n',transpose (initial_bin2comimag));
fclose (fid);




