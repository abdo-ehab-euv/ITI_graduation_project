clear all ; close all; clc


addpath 'common'
addpath 'transmitter'
%-------------------------------------------------------------------------%
%-*****************  transceiver configurations  ************************-%
%-------------------------------------------------------------------------%
 dataRateArray = [ 0 1 ];  % 0 for  1 Mb/s  , 1  for 250 kb/s
% Set the global Variables for both Transmitter and Receiver 
global chirpIndex ;     % chirp Sequence Index= 1, 2, 3 or 4
global samplingFreqMhz; % Sampling Frequency in MHz
global carrierFreqGHz;  % Carrier frequency in GHz
global codeWordLengthStd;
global preambleLengthStd;
global Tchirp;
global Tsub;
global Tgap;
global TxDACbitNumber;
global chirpSequenceNumBit_Rx;
% 
global TxChirpSequencesLength;

%=========================================================================%
%======================== Simulation parameters script ===================%
%=========================================================================%
%simulationParameters
%=========================================================================%
%EbNodB = [ startEbNodB : stepEbNodB : stopEbNodB ];

%-------------------------------------------------------------------------%
%globalSettings();
samplingFreqMhz=32;  % Sampling Frequency in MHz
carrierFreqGHz=2.45; % Carrier frequency in GHz
% ----------------------------------------------------------------------- %
% ----------------------------------------------------------------------- %
% Table 26g�Equation (1a) numerical parameters�timing parameters
% timing parameters values Multiple of 1/32MHz
% Tchirp 6 us 
% Tsub 1.1875 us 
% T1 = 1468.75 us 
% T2 = 2312.5 ns 
% T3 = 4156.25 ns 
% T4 = 0 ns 
% ----------------------------------------------------------------------- %
Tchirp= 6 * samplingFreqMhz;
Tsub = 1.1875 * samplingFreqMhz;
Tau_m = [0.46875, 0.3125, 0.15625, 0]* samplingFreqMhz;

% ----------------------------------------------------------------------- %
% Analog to Digital Converter Resolution.
% digital to analogue converter number of bits in Transmitter 
% ----------------------------------------------------------------------- %
TxDACbitNumber = 6 ;
chirpSequenceNumBit_Rx = 6 ;
%frequencyOffsetkHz = offsetPPM *carrierFreqGHz;
%phaseRotationPerSample = 2*pi*frequencyOffsetkHz/samplingFreqMhz/1000;

%-------------------------------------------------------------------------%
% numDataRatesToSimulate = length(dataRateArray);
% numSNRlevelsToSimulate = length(EbNodB);
% 
% % pre-allocating just for speed simulation
% numPacketErrors=zeros(numDataRatesToSimulate,numSNRlevelsToSimulate);
% numSimulatedPackets=zeros(numDataRatesToSimulate,numSNRlevelsToSimulate);
% numSyncPassedPackets=zeros(numDataRatesToSimulate,numSNRlevelsToSimulate);
% sumFreqOffsetHz=zeros(numDataRatesToSimulate,numSNRlevelsToSimulate);
% sumSNR_estimationErrordB_Squared = zeros(numDataRatesToSimulate,numSNRlevelsToSimulate);
% sumFreqOffsetHzSquared=zeros(numDataRatesToSimulate,numSNRlevelsToSimulate);
%[CIRmatrix ] = CIRselection( selectedCIRindex );

%profile on

%-------------------------------------------------------------------------%
% for numDataRate = 1 : numDataRatesToSimulate
%     %-------------------------------------------------------------------------%
%     dataRate = dataRateArray(numDataRate);
%     %=========================================================================%
%     if dataRate == 0 
%         rate = '1 Mb/s';
%         codingRate = 3/4;  % 1 Mb/s code rate of block coding
%         codeWordLength = codeWordLengthStd(1);
%     else
%         rate = '250 kb/s';
%         codingRate = 6/32;  % 250 kb/s code rate of block coding
%         codeWordLength = codeWordLengthStd(2);
%     end
%     % Find the number of samples in preamble
%     numPreambleSamples=preambleLengthStd(dataRate+1)*Tchirp/4;
%     %-------------------------------------------------------------------------%
%     tic
% end

%%%%%%%%%%%%%%%%%%%%% CSK for m = 1 %%%%%%%%%%%%%%%%%%%%
chirpIndex=1;
% ----------------------------------------------------------------------- %
% ----------------------------------------------------------------------- %
% 6.5a.4.2 Active usage of time gaps
% ----------------------------------------------------------------------- %
% ----------------------------------------------------------------------- %
% In conjunction with the subchirp sequence , Different pairs of time gaps 
% are defined. The time gaps are chosen to make the four sequences even 
% closer to being orthogonal. The time gaps shall be applied alternatively 
% between subsequent chirp symbols as shown  in Figure 20d. 
% The values of the time gaps are calculated from the timing parameters 
% specified in Table 26g (in 6.5a.4.3). 
Tgap(1) = Tchirp - 4*Tsub - 2*Tau_m(chirpIndex);
Tgap(2) = Tchirp - 4*Tsub + 2*Tau_m(chirpIndex);
%--- sampling ---%
chirpSequence_m_1 = chirpSequenceGenerator(chirpIndex, samplingFreqMhz );
%--- quantization ---%
chirpSequence_1_Tx = floor ( chirpSequence_m_1 * (2^(TxDACbitNumber -1)-1) ) ;
%--- obtaining real and imaginary parts ---%
chirpSequence_1_Real_tofile = real(chirpSequence_1_Tx(1:end));
chirpSequence_1_Imag_tofile = imag(chirpSequence_1_Tx(1:end));
%--- Converting to Fixed Point ---%
            re = fi(chirpSequence_1_Real_tofile,1,6,0);
            im = fi(chirpSequence_1_Imag_tofile,1,6,0);
%--- Converting the Fixed Point decimal to a binary number ---%           
            for n = 1 : length(chirpSequence_1_Real_tofile)
                chirpbin2comreal_1(n,:) = bin(re(n));
                chirpbin2comimag_1(n,:) = bin(im(n));
            end
%--- Writing each of the real and imaginary components to a separate file ---%
            fid = fopen('chirpSequence_1_Real_tofile.txt', 'wt' );
            fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comreal_1));
            fclose (fid);         
            fid = fopen('chirpSequence_1_Imag_tofile.txt', 'wt' );
            fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comimag_1));
            fclose (fid);

%%%%%%%%%%%%%%%%%%%%% CSK for m = 2 %%%%%%%%%%%%%%%%%%%%
chirpIndex=2;
% ----------------------------------------------------------------------- %
% ----------------------------------------------------------------------- %
% 6.5a.4.2 Active usage of time gaps
% ----------------------------------------------------------------------- %
% ----------------------------------------------------------------------- %
% In conjunction with the subchirp sequence , Different pairs of time gaps 
% are defined. The time gaps are chosen to make the four sequences even 
% closer to being orthogonal. The time gaps shall be applied alternatively 
% between subsequent chirp symbols as shown  in Figure 20d. 
% The values of the time gaps are calculated from the timing parameters 
% specified in Table 26g (in 6.5a.4.3). 
Tgap(1) = Tchirp - 4*Tsub - 2*Tau_m(chirpIndex);
Tgap(2) = Tchirp - 4*Tsub + 2*Tau_m(chirpIndex);
%--- sampling ---%
chirpSequence_m_2 = chirpSequenceGenerator(chirpIndex, samplingFreqMhz );
%--- quantization ---%
chirpSequence_2_Tx = floor ( chirpSequence_m_2 * (2^(TxDACbitNumber -1)-1) ) ;
%--- obtaining real and imaginary parts ---%
chirpSequence_2_Real_tofile = real(chirpSequence_2_Tx(1:end));
chirpSequence_2_Imag_tofile = imag(chirpSequence_2_Tx(1:end));
%--- Converting to Fixed Point ---%
            re = fi(chirpSequence_2_Real_tofile,1,6,0);
            im = fi(chirpSequence_2_Imag_tofile,1,6,0);
%--- Converting the Fixed Point decimal to a binary number ---%            
            for n = 1 : length(chirpSequence_2_Real_tofile)
                chirpbin2comreal_2(n,:) = bin(re(n));
                chirpbin2comimag_2(n,:) = bin(im(n));
            end
%--- Writing each of the real and imaginary components to a separate file ---%            
            fid = fopen('chirpSequence_2_Real_tofile.txt', 'wt' );
            fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comreal_2));
            fclose (fid);                    
            fid = fopen('chirpSequence_2_Imag_tofile.txt', 'wt' );
            fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comimag_2));
            fclose (fid);

%%%%%%%%%%%%%%%%%%%%% CSK for m = 3 %%%%%%%%%%%%%%%%%%%%
chirpIndex=3;
% ----------------------------------------------------------------------- %
% ----------------------------------------------------------------------- %
% 6.5a.4.2 Active usage of time gaps
% ----------------------------------------------------------------------- %
% ----------------------------------------------------------------------- %
% In conjunction with the subchirp sequence , Different pairs of time gaps 
% are defined. The time gaps are chosen to make the four sequences even 
% closer to being orthogonal. The time gaps shall be applied alternatively 
% between subsequent chirp symbols as shown  in Figure 20d. 
% The values of the time gaps are calculated from the timing parameters 
% specified in Table 26g (in 6.5a.4.3). 
Tgap(1) = Tchirp - 4*Tsub - 2*Tau_m(chirpIndex);
Tgap(2) = Tchirp - 4*Tsub + 2*Tau_m(chirpIndex);
%--- sampling ---%
chirpSequence_m_3 = chirpSequenceGenerator(chirpIndex, samplingFreqMhz );
%--- quantization ---%
chirpSequence_3_Tx = floor ( chirpSequence_m_3 * (2^(TxDACbitNumber -1)-1) ) ;
%--- obtaining real and imaginary parts ---%
chirpSequence_3_Real_tofile = real(chirpSequence_3_Tx(1:end));
chirpSequence_3_Imag_tofile = imag(chirpSequence_3_Tx(1:end));
%--- Converting to Fixed Point ---%
            re = fi(chirpSequence_3_Real_tofile,1,6,0);
            im = fi(chirpSequence_3_Imag_tofile,1,6,0);
%--- Converting the Fixed Point decimal to a binary number ---%             
            for n = 1 : length(chirpSequence_3_Real_tofile)
                chirpbin2comreal_3(n,:) = bin(re(n));
                chirpbin2comimag_3(n,:) = bin(im(n));
            end

%--- Writing each of the real and imaginary components to a separate file ---%            
            fid = fopen('chirpSequence_3_Real_tofile.txt', 'wt' );
            fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comreal_3));
            fclose (fid);
            fid = fopen('chirpSequence_3_Imag_tofile.txt', 'wt' );
            fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comimag_3));
            fclose (fid);

%%%%%%%%%%%%%%%%%%%%% CSK for m = 4 %%%%%%%%%%%%%%%%%%%%
chirpIndex=4;
% ----------------------------------------------------------------------- %
% ----------------------------------------------------------------------- %
% 6.5a.4.2 Active usage of time gaps
% ----------------------------------------------------------------------- %
% ----------------------------------------------------------------------- %
% In conjunction with the subchirp sequence , Different pairs of time gaps 
% are defined. The time gaps are chosen to make the four sequences even 
% closer to being orthogonal. The time gaps shall be applied alternatively 
% between subsequent chirp symbols as shown  in Figure 20d. 
% The values of the time gaps are calculated from the timing parameters 
% specified in Table 26g (in 6.5a.4.3). 
Tgap(1) = Tchirp - 4*Tsub - 2*Tau_m(chirpIndex);
Tgap(2) = Tchirp - 4*Tsub + 2*Tau_m(chirpIndex);
%--- sampling ---%
chirpSequence_m_4 = chirpSequenceGenerator(chirpIndex, samplingFreqMhz );
%--- quantization ---%
chirpSequence_4_Tx = floor ( chirpSequence_m_4 * (2^(TxDACbitNumber -1)-1) ) ;
%--- obtaining real and imaginary parts ---%
chirpSequence_4_Real_tofile = real(chirpSequence_4_Tx(1:end));
chirpSequence_4_Imag_tofile = imag(chirpSequence_4_Tx(1:end));
%--- Converting to Fixed Point ---%
            re = fi(chirpSequence_4_Real_tofile,1,6,0);
            im = fi(chirpSequence_4_Imag_tofile,1,6,0);
%--- Converting the Fixed Point decimal to a binary number ---%             
            for n = 1 : length(chirpSequence_4_Real_tofile)
                chirpbin2comreal_4(n,:) = bin(re(n));
                chirpbin2comimag_4(n,:) = bin(im(n));
            end
%--- Writing each of the real and imaginary components to a separate file ---%            
            fid = fopen('chirpSequence_4_Real_tofile.txt', 'wt' );
            fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comreal_4));
            fclose (fid); 
            fid = fopen('chirpSequence_4_Imag_tofile.txt', 'wt' );
            fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comimag_4));
            fclose (fid);

%--- Writing all the real parts in one file ---%
fid = fopen('chirpSequence_combined_Real_tofile.txt', 'wt' );
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comreal_1));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 10, 6)));
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comreal_1));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 70, 6)));

fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comreal_2));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 20, 6)));
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comreal_2));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 60, 6)));

fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comreal_3));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 30, 6)));
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comreal_3));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 50, 6)));

fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comreal_4));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 40, 6)));
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comreal_4));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 40, 6)));

fclose(fid);

% 1. Read the binary strings from your text file
binStrings = readlines('chirpSequence_combined_Real_tofile.txt'); 

% Clean up any empty lines at the end of the file
binStrings(binStrings == "") = [];

% 2. Convert the binary strings to raw unsigned decimals
decimal_data = bin2dec(binStrings);

% 3. Apply 2's complement logic for 6 bits
% In 6-bit 2's complement, values range from -32 to +31.
% If the value is 32 or greater (MSB is 1), subtract 64 (2^6) to make it negative.
isNegative = decimal_data >= 32; 
decimal_data(isNegative) = decimal_data(isNegative) - 64;

% 4. Create the X-axis starting from 0
x = 0:(length(decimal_data) - 1);

% 5. Plot the data
figure;
plot(x, decimal_data, 'LineWidth', 1.5) % 'b-o' adds markers to each data point
xlabel('Samples')
ylabel('Value')
title('CSS Sequence I output')
ylim([-35 35]) % Sets boundaries to fit all possible 6-bit values cleanly
grid on;


%--- Writing all the imaginary parts in one file ---%
fid = fopen('chirpSequence_combined_Imag_tofile.txt', 'wt' );
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comimag_1));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 10, 6)));
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comimag_1));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 70, 6)));

fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comimag_2));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 20, 6)));
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comimag_2));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 60, 6)));

fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comimag_3));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 30, 6)));
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comimag_3));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 50, 6)));

fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comimag_4));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 40, 6)));
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comimag_4));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 40, 6)));

fclose(fid);

% 1. Read the binary strings from your text file
binStrings = readlines('chirpSequence_combined_Imag_tofile.txt'); 

% Clean up any empty lines at the end of the file
binStrings(binStrings == "") = [];

% 2. Convert the binary strings to raw unsigned decimals
decimal_data = bin2dec(binStrings);

% 3. Apply 2's complement logic for 6 bits
% In 6-bit 2's complement, values range from -32 to +31.
% If the value is 32 or greater (MSB is 1), subtract 64 (2^6) to make it negative.
isNegative = decimal_data >= 32; 
decimal_data(isNegative) = decimal_data(isNegative) - 64;

% 4. Create the X-axis starting from 0
x = 0:(length(decimal_data) - 1);

% 5. Plot the data
figure;
plot(x, decimal_data, 'LineWidth', 1.5) % 'b-o' adds markers to each data point
xlabel('Samples')
ylabel('Value')
title('CSS Sequence Q Output')
ylim([-35 35]) % Sets boundaries to fit all possible 6-bit values cleanly
grid on;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%--The part below represents the same as the part above but in --%%
%%-- polar form instead of cartesian form                       --%%                          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%% CSK for m = 1 %%%%%%%%%%%%%%%%%%%%
chirpIndex=1;
% ----------------------------------------------------------------------- %
% ----------------------------------------------------------------------- %
% 6.5a.4.2 Active usage of time gaps
% ----------------------------------------------------------------------- %
% ----------------------------------------------------------------------- %
% In conjunction with the subchirp sequence , Different pairs of time gaps 
% are defined. The time gaps are chosen to make the four sequences even 
% closer to being orthogonal. The time gaps shall be applied alternatively 
% between subsequent chirp symbols as shown  in Figure 20d. 
% The values of the time gaps are calculated from the timing parameters 
% specified in Table 26g (in 6.5a.4.3). 
Tgap(1) = Tchirp - 4*Tsub - 2*Tau_m(chirpIndex);
Tgap(2) = Tchirp - 4*Tsub + 2*Tau_m(chirpIndex);
%--- sampling ---%
chirpSequence_m_1_polar = chirpSequenceGenerator(chirpIndex, samplingFreqMhz );
%--- quantization ---%
chirpSequence_1_Tx_polar = floor ( chirpSequence_m_1_polar * (2^(TxDACbitNumber -1)-1) ) ;
%--- obtaining real and imaginary parts ---%
chirpSequence_1_abs_tofile = abs(chirpSequence_1_Tx_polar(1:end));
chirpSequence_1_angle_tofile = angle(chirpSequence_1_Tx_polar(1:end));
%--- Converting to Fixed Point ---%
            amp = fi(chirpSequence_1_abs_tofile,1,6,0);
            phase = fi(chirpSequence_1_angle_tofile,1,6,0);
%--- Converting the Fixed Point decimal to a binary number ---%           
            for n = 1 : length(chirpSequence_1_abs_tofile)
                chirpbin2comabs_1(n,:) = bin(amp(n));
                chirpbin2comangle_1(n,:) = bin(phase(n));
            end
%--- Writing each of the real and imaginary components to a separate file ---%
            fid = fopen('chirpSequence_1_Abs_tofile.txt', 'wt' );
            fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comabs_1));
            fclose (fid);         
            fid = fopen('chirpSequence_1_Angle_tofile.txt', 'wt' );
            fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comangle_1));
            fclose (fid);

%%%%%%%%%%%%%%%%%%%%% CSK for m = 2 %%%%%%%%%%%%%%%%%%%%
chirpIndex=2;
% ----------------------------------------------------------------------- %
% ----------------------------------------------------------------------- %
% 6.5a.4.2 Active usage of time gaps
% ----------------------------------------------------------------------- %
% ----------------------------------------------------------------------- %
% In conjunction with the subchirp sequence , Different pairs of time gaps 
% are defined. The time gaps are chosen to make the four sequences even 
% closer to being orthogonal. The time gaps shall be applied alternatively 
% between subsequent chirp symbols as shown  in Figure 20d. 
% The values of the time gaps are calculated from the timing parameters 
% specified in Table 26g (in 6.5a.4.3). 
Tgap(1) = Tchirp - 4*Tsub - 2*Tau_m(chirpIndex);
Tgap(2) = Tchirp - 4*Tsub + 2*Tau_m(chirpIndex);
%--- sampling ---%
chirpSequence_m_2_polar = chirpSequenceGenerator(chirpIndex, samplingFreqMhz );
%--- quantization ---%
chirpSequence_2_Tx_polar = floor ( chirpSequence_m_2_polar * (2^(TxDACbitNumber -1)-1) ) ;
%--- obtaining real and imaginary parts ---%
chirpSequence_2_abs_tofile = abs(chirpSequence_2_Tx_polar(1:end));
chirpSequence_2_angle_tofile = angle(chirpSequence_2_Tx_polar(1:end));
%--- Converting to Fixed Point ---%
            amp = fi(chirpSequence_2_abs_tofile,1,6,0);
            phase = fi(chirpSequence_2_angle_tofile,1,6,0);
%--- Converting the Fixed Point decimal to a binary number ---%            
            for n = 1 : length(chirpSequence_2_Real_tofile)
                chirpbin2comabs_2(n,:) = bin(amp(n));
                chirpbin2comangle_2(n,:) = bin(phase(n));
            end
%--- Writing each of the real and imaginary components to a separate file ---%            
            fid = fopen('chirpSequence_2_Abs_tofile.txt', 'wt' );
            fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comabs_2));
            fclose (fid);                    
            fid = fopen('chirpSequence_2_Angle_tofile.txt', 'wt' );
            fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comangle_2));
            fclose (fid);

%%%%%%%%%%%%%%%%%%%%% CSK for m = 3 %%%%%%%%%%%%%%%%%%%%
chirpIndex=3;
% ----------------------------------------------------------------------- %
% ----------------------------------------------------------------------- %
% 6.5a.4.2 Active usage of time gaps
% ----------------------------------------------------------------------- %
% ----------------------------------------------------------------------- %
% In conjunction with the subchirp sequence , Different pairs of time gaps 
% are defined. The time gaps are chosen to make the four sequences even 
% closer to being orthogonal. The time gaps shall be applied alternatively 
% between subsequent chirp symbols as shown  in Figure 20d. 
% The values of the time gaps are calculated from the timing parameters 
% specified in Table 26g (in 6.5a.4.3). 
Tgap(1) = Tchirp - 4*Tsub - 2*Tau_m(chirpIndex);
Tgap(2) = Tchirp - 4*Tsub + 2*Tau_m(chirpIndex);
%--- sampling ---%
chirpSequence_m_3_polar = chirpSequenceGenerator(chirpIndex, samplingFreqMhz );
%--- quantization ---%
chirpSequence_3_Tx_polar = floor ( chirpSequence_m_3_polar * (2^(TxDACbitNumber -1)-1) ) ;
%--- obtaining real and imaginary parts ---%
chirpSequence_3_abs_tofile = abs(chirpSequence_3_Tx_polar(1:end));
chirpSequence_3_angle_tofile = angle(chirpSequence_3_Tx_polar(1:end));
%--- Converting to Fixed Point ---%
            amp = fi(chirpSequence_3_abs_tofile,1,6,0);
            phase = fi(chirpSequence_3_angle_tofile,1,6,0);
%--- Converting the Fixed Point decimal to a binary number ---%             
            for n = 1 : length(chirpSequence_3_abs_tofile)
                chirpbin2comabs_3(n,:) = bin(amp(n));
                chirpbin2comangle_3(n,:) = bin(phase(n));
            end

%--- Writing each of the real and imaginary components to a separate file ---%            
            fid = fopen('chirpSequence_3_Abs_tofile.txt', 'wt' );
            fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comabs_3));
            fclose (fid);
            fid = fopen('chirpSequence_3_Angle_tofile.txt', 'wt' );
            fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comangle_3));
            fclose (fid);

%%%%%%%%%%%%%%%%%%%%% CSK for m = 4 %%%%%%%%%%%%%%%%%%%%
chirpIndex=4;
% ----------------------------------------------------------------------- %
% ----------------------------------------------------------------------- %
% 6.5a.4.2 Active usage of time gaps
% ----------------------------------------------------------------------- %
% ----------------------------------------------------------------------- %
% In conjunction with the subchirp sequence , Different pairs of time gaps 
% are defined. The time gaps are chosen to make the four sequences even 
% closer to being orthogonal. The time gaps shall be applied alternatively 
% between subsequent chirp symbols as shown  in Figure 20d. 
% The values of the time gaps are calculated from the timing parameters 
% specified in Table 26g (in 6.5a.4.3). 
Tgap(1) = Tchirp - 4*Tsub - 2*Tau_m(chirpIndex);
Tgap(2) = Tchirp - 4*Tsub + 2*Tau_m(chirpIndex);
%--- sampling ---%
chirpSequence_m_4_polar = chirpSequenceGenerator(chirpIndex, samplingFreqMhz );
%--- quantization ---%
chirpSequence_4_Tx_polar = floor ( chirpSequence_m_4_polar * (2^(TxDACbitNumber -1)-1) ) ;
%--- obtaining real and imaginary parts ---%
chirpSequence_4_abs_tofile = abs(chirpSequence_4_Tx_polar(1:end));
chirpSequence_4_angle_tofile = angle(chirpSequence_4_Tx_polar(1:end));
%--- Converting to Fixed Point ---%
            amp = fi(chirpSequence_4_abs_tofile,1,6,0);
            phase = fi(chirpSequence_4_angle_tofile,1,6,0);
%--- Converting the Fixed Point decimal to a binary number ---%             
            for n = 1 : length(chirpSequence_4_abs_tofile)
                chirpbin2comabs_4(n,:) = bin(amp(n));
                chirpbin2comangle_4(n,:) = bin(phase(n));
            end
%--- Writing each of the real and imaginary components to a separate file ---%            
            fid = fopen('chirpSequence_4_Abs_tofile.txt', 'wt' );
            fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comabs_4));
            fclose (fid); 
            fid = fopen('chirpSequence_4_Angle_tofile.txt', 'wt' );
            fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comangle_4));
            fclose (fid);

%--- Writing all the real parts in one file ---%
fid = fopen('chirpSequence_combined_Abs_tofile.txt', 'wt' );
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comabs_1));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 10, 6)));
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comabs_1));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 70, 6)));

fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comabs_2));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 20, 6)));
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comabs_2));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 60, 6)));

fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comabs_3));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 30, 6)));
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comabs_3));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 50, 6)));

fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comabs_4));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 40, 6)));
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comabs_4));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 40, 6)));

fclose(fid);



%--- Writing all the imaginary parts in one file ---%
fid = fopen('chirpSequence_combined_Angle_tofile.txt', 'wt' );
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comangle_1));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 10, 6)));
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comangle_1));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 70, 6)));

fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comangle_2));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 20, 6)));
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comangle_2));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 60, 6)));

fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comangle_3));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 30, 6)));
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comangle_3));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 50, 6)));

fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comangle_4));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 40, 6)));
fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comangle_4));
fprintf(fid, '%c%c%c%c%c%c\n', transpose(repmat('0', 40, 6)));

fclose(fid);
