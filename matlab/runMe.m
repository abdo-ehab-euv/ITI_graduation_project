%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%
clc
clear all
rand('state',0);
randn('state',0);
%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%
addpath 'common'
addpath 'transmitter'
%-------------------------------------------------------------------------%
%load cm1_to_8__32MHz.mat 
%figure
%plot(abs(h1))
%title('LOS Residential (CM1)')
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

global TxDACbitNumber;
global chirpSequenceNumBit_Rx;
% 
global TxChirpSequencesLength;
%=========================================================================%
%======================== Simulation parameters script ===================%
%=========================================================================%
simulationParameters
%=========================================================================%
EbNodB = [ startEbNodB : stepEbNodB : stopEbNodB ];

%-------------------------------------------------------------------------%
globalSettings();
frequencyOffsetkHz = offsetPPM *carrierFreqGHz;
phaseRotationPerSample = 2*pi*frequencyOffsetkHz/samplingFreqMhz/1000;

%-------------------------------------------------------------------------%
numDataRatesToSimulate = length(dataRateArray);
numSNRlevelsToSimulate = length(EbNodB);

% pre-allocating just for speed simulation
numPacketErrors=zeros(numDataRatesToSimulate,numSNRlevelsToSimulate);
numSimulatedPackets=zeros(numDataRatesToSimulate,numSNRlevelsToSimulate);
numSyncPassedPackets=zeros(numDataRatesToSimulate,numSNRlevelsToSimulate);
sumFreqOffsetHz=zeros(numDataRatesToSimulate,numSNRlevelsToSimulate);
sumSNR_estimationErrordB_Squared = zeros(numDataRatesToSimulate,numSNRlevelsToSimulate);
sumFreqOffsetHzSquared=zeros(numDataRatesToSimulate,numSNRlevelsToSimulate);
%[CIRmatrix ] = CIRselection( selectedCIRindex );

%profile on
%-------------------------------------------------------------------------%
%for numDataRate = 1 : numDataRatesToSimulate
dataRate = 0;
%-------------------------------------------------------------------------%
%dataRate = dataRateArray(numDataRate);
%=========================================================================%
if dataRate == 0 
     rate = '1 Mb/s';
     codingRate = 3/4;  % 1 Mb/s code rate of block coding
     codeWordLength = codeWordLengthStd(1);
else
     rate = '250 kb/s';
     codingRate = 6/32;  % 250 kb/s code rate of block coding
     codeWordLength = codeWordLengthStd(2);
end
% Find the number of samples in preamble
numPreambleSamples=preambleLengthStd(dataRate+1)*Tchirp/4;
%-------------------------------------------------------------------------%
tic
%-------------------------------------------------------------------------%
% This function generates the chirp sequence which consists of 4 chirp
% subsequences, accroding to equation (1a) and figure 20c
chirpSequence_1 = chirpSequenceGenerator(1, samplingFreqMhz );
chirpSequence_2 = chirpSequenceGenerator(2, samplingFreqMhz );
chirpSequence_3 = chirpSequenceGenerator(3, samplingFreqMhz );
chirpSequence_4 = chirpSequenceGenerator(4, samplingFreqMhz );
%####################################################################### %
%----------------- Fixed Point Representation -------------------------- %
%put chirp sequence samples in (TxDACbitNumber)signed bit integer.
chirpSequence_Tx_1 = floor ( chirpSequence_1 * (2^(TxDACbitNumber -1)-1) ) ;
chirpSequence_Tx_2 = floor ( chirpSequence_2 * (2^(TxDACbitNumber -1)-1) ) ;
chirpSequence_Tx_3 = floor ( chirpSequence_3 * (2^(TxDACbitNumber -1)-1) ) ;
chirpSequence_Tx_4 = floor ( chirpSequence_4 * (2^(TxDACbitNumber -1)-1) ) ;
%-------------------------------------------------------------------------%
% ###################### file Input Output ############################## %
            % chirpSequenceReal_tofile = real(chirpSequence_Tx_1(1:end));
            % chirpSequenceImag_tofile = imag(chirpSequence_Tx_1(1:end));
            % re = fi(chirpSequenceReal_tofile,1,5,0);
            % im = fi(chirpSequenceImag_tofile,1,5,0);
            % 
            % for n = 1 : length(chirpSequenceReal_tofile)
            %     chirpbin2comreal(n,:) = bin(re(n));
            %     chirpbin2comimag(n,:) = bin(im(n));
            % end
            % fid = fopen('chirpSequenceReal_tofile.txt', 'wt' );
            % fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comreal));
            % fclose (fid);
            % 
            % fid = fopen('chirpSequenceImag_tofile.txt', 'wt' );
            % fprintf(fid, '%c%c%c%c%c%c\n',transpose (chirpbin2comimag));
            % fclose (fid);


         %   TxchirpSequences = ...
          %      chirpModulation( DQPSK_output , chirpSequence );

          scale_factor = (2^(TxDACbitNumber - 1) - 1);
          chirp_Tx{1} = floor(chirpSequenceGenerator(1, samplingFreqMhz) * scale_factor);
          chirp_Tx{2} = floor(chirpSequenceGenerator(2, samplingFreqMhz) * scale_factor);
          chirp_Tx{3} = floor(chirpSequenceGenerator(3, samplingFreqMhz) * scale_factor);
          chirp_Tx{4} = floor(chirpSequenceGenerator(4, samplingFreqMhz) * scale_factor);

% ###################### main CSS chain ############################## %
%-------------------------------------------------------------------------%
 fid = fopen('data_input.txt', 'r');
% Read as characters, convert to digits, and ensure it's a row vector
incomingStream = fscanf(fid, '%c')' - '0'; 
fclose(fid);
% Keep only the actual binary bits (0 or 1) and make it a row vector
incomingStream = incomingStream(incomingStream == 0 | incomingStream == 1)';

%bitsPerSymbol = 2;              % DQPSK uses 2 bits per symbol
%symbolsPerBlock = 8;            % Process 8 symbols per m-sequence type
%bitsPerBlock = symbolsPerBlock * bitsPerSymbol; % 16 bits per block

ModulatedchirpSequences = [];

%bitPointer = 1;
m_index = 1;

unused_sequence= ChirpSpreadSpectrum_Tx ( incomingStream , dataRate, chirpSequence_Tx_1 );

% Directly read the complex numbers into a matrix/vector
DQPSK_output = readmatrix('DQPSK_output.txt');

% Flatten the matrix into a single row vector (matching your original intent)
DQPSK_output = reshape(DQPSK_output, 1, []);
symbolsPerBlock = 8; % 16 bits / 2 bits per DQPSK symbol
symPointer = 1;

while symPointer <= length(DQPSK_output)
    % 1. Slice out exactly 8 DQPSK symbols for this chirp block
    endSymPointer = min(symPointer + symbolsPerBlock - 1, length(DQPSK_output));
    currentSymbolChunk = DQPSK_output(symPointer:endSymPointer);
    
    % 2. Select the active base sequence (m rotates 1 -> 2 -> 3 -> 4)
    activeChirpBase = chirp_Tx{m_index};
    
    % 3. Call the pulled-out generator directly in the main script
    % Pass the 8 complex symbols and the base sub-chirp sequence
    chunkModulated = chirpModulation(currentSymbolChunk, activeChirpBase, m_index);
    
    % TxchirpSequences = ...
    %      chirpModulation( DQPSK_output , chirpSequence );

    % 4. Append to main transmission chain
    ModulatedchirpSequences = [ModulatedchirpSequences, chunkModulated];
    
    % --- Update Pointers for Next Chirp Block ---
    symPointer = symPointer + symbolsPerBlock;
    m_index = mod(m_index, 4) + 1; 
end
% ModulatedchirpSequences= ChirpSpreadSpectrum_Tx ( incomingStream , dataRate, chirpSequence_Tx_1 );


% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% %  
% % % THE NEWLY ADDED PART WHICH GENERATES THE CHIRP SEQUENCE FOR M=1 THEN M=2
% % THEN M=3 THEN M=4
% % %
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% fid = fopen('PSDU_random.txt', 'r');
% incomingStream = fscanf(fid, '%c')' - '0';
% fclose(fid);
% incomingStream = incomingStream(incomingStream == 0 | incomingStream == 1)';
% 
% % --- NEW: Initialize an array to accumulate all 4 active signals ---
% CombinedModulatedSequences = 0; 
% 
% % --- NEW: Loop through all 4 chirp sequences together ---
% for m = 1:4
%     % 1. Generate the specific sub-chirp pattern matrix for index m
%     chirpSequence = chirpSequenceGenerator(m, samplingFreqMhz);
% 
%     % 2. Convert to Fixed Point representation
%     chirpSequence_Tx = floor(chirpSequence * (2^(TxDACbitNumber - 1) - 1));
% 
%     % 3. Modulate the stream using the current chirp pattern
%     % Note: If each user has different data, replace 'incomingStream' with user-specific data
%     currentModulated = ChirpSpreadSpectrum_Tx(incomingStream, dataRate, chirpSequence_Tx);
% 
%     % 4. Linearly combine the waveforms into the active channel session
%     CombinedModulatedSequences = CombinedModulatedSequences + currentModulated;
% end
% 
% % Assign back to your original variable name so the plotting code works seamlessly
% ModulatedChirpSequences = CombinedModulatedSequences;
% 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% %  
% % % THIS IS THE END OF THE NEWLY ADDED PART !
% % %
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %


ModulatedchirpSequences = floor ( ModulatedchirpSequences * (2^(TxDACbitNumber -1)-1) ) ;

DACchirpSequence = ModulatedchirpSequences / (2^(TxDACbitNumber -1) -1);

% 1. Undo the normalization to get the raw 6-bit integer values (-32 to +31)
hardware_integers = real(ModulatedchirpSequences); 

% 2. Open a new figure window
figure; 

% 3. Plot using stairs() to show the discrete digital staircase steps
stairs(hardware_integers, 'LineWidth', 0.1);
grid on;
xlabel('Samples');
ylabel('Digital Value (6-bit Signed Integer)');
title('Digital DAC Output (I Component)');


figure;

% Top Subplot: The In-Phase (I) Component
subplot(2,1,1);
stairs(real(ModulatedchirpSequences(1:100)), 'LineWidth', 1.5, 'Color', 'b');
grid on;
ylabel('Digital Value');
title('I Component (Real)');

% Bottom Subplot: The Quadrature (Q) Component 
subplot(2,1,2);
stairs(imag(ModulatedchirpSequences(1:100)), 'LineWidth', 1.5, 'Color', 'r');
grid on;
xlabel('Samples');
ylabel('Digital Value');
title('Q Component (Imaginary - 90° Phase Shifted)');


% ###################### file Input Output ############################## %
chirpSequenceReal_tofile = real(ModulatedchirpSequences(1:end));
chirpSequenceImag_tofile = imag(ModulatedchirpSequences(1:end));
re = fi(chirpSequenceReal_tofile,1,5,0);
im = fi(chirpSequenceImag_tofile,1,5,0);

for n = 1 : length(chirpSequenceReal_tofile)
    chirpbin2comreal(n,:) = bin(re(n));
    chirpbin2comimag(n,:) = bin(im(n));
end
fid = fopen('ModulatedchirpSequences_Real_tofile.txt', 'wt' );
fprintf(fid, '%c%c%c%c%c\n',transpose (chirpbin2comreal));
fclose (fid);

fid = fopen('ModulatedchirpSequences_Imag_tofile.txt', 'wt' );
fprintf(fid, '%c%c%c%c%c\n',transpose (chirpbin2comimag));
fclose (fid);


% ####################################################################### %



% ###################### file Input Output ############################## %
%-------------------------------------------------------------------------%
 %chirpSequence_Tx = chirpSequence_Tx / (2^(TxDACbitNumber -1)-1);
% ####################################################################### %

%energyPerSubChirp=sum(sum(abs(chirpSequence_Tx).^2))/4;
%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%
%end

