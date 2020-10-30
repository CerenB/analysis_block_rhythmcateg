% (C) Copyright 2019 CPP BIDS SPM-pipeline developpers

function opt = getOptionCategBlock()
    % opt = getOption()
    % returns a structure that contains the options chosen by the user to run
    % slice timing correction, pre-processing, FFX, RFX.

    if nargin < 1
        opt = [];
    end

    % group of subjects to analyze
    opt.groups = {''};
    % suject to run in each group
    opt.subjects = {'001'};

    % we stay in native space (that of the T1)
    opt.space = 'T1w';

    % The directory where the data are located
    opt.dataDir = fullfile(fileparts(mfilename('fullpath')), ...
                           '..', '..', '..',  'raw');

    % task to analyze
    opt.taskName = 'RhythmCategBlock';

    % Suffix output directory for the saved jobs
    opt.jobsDir = fullfile( ...
                           opt.dataDir, '..', 'derivatives', ...
                           'SPM12_CPPL', 'JOBS', opt.taskName);

    % specify the model file that contains the contrasts to compute
    opt.model.univariate.file =  ...
        fullfile(fileparts(mfilename('fullpath')), '..', ...
                 'model', 'model-RhythmCategBlock_smdl.json');

    opt.model.multivariate.file = '';

    % Options for slice time correction

    % sub-001
    %     opt.sliceOrder = [0;1.3000;0.0590;1.3591;0.1181;1.4182;0.1772;1.4773; ...
    %                         0.2363;1.5363;0.2954;1.5954;0.3545;1.6545;0.4136; ...
    %                         1.7136;0.4727;1.7727;0.5318;1.8318;0.5909;1.8909; ...
    %                         0.6500;1.9500;0.7091;2.0091;0.7681;2.0682;0.8272; ...
    %                         2.1272;0.8863;2.1863;0.9454;2.2454;1.0045;2.3045; ...
    %                         1.0636;2.3636;1.1227;2.4227;1.1818;2.4818;1.2409; ...
    %                         2.5409];

    % sub-002
    opt.sliceOrder = [0; 1.3549; 0.0588999; 1.4138; 0.1178; 1.4728; 0.1767; 1.5317; ...
                      0.2356; 1.5906; 0.2945; 1.6495; 0.3534; 1.7084; 0.4123; ...
                      1.7673; 0.4712; 1.8262; 0.5302; 1.8851; 0.5891; 1.944; ...
                      0.648; 2.003; 0.7069; 2.0619; 0.7658; 2.1208; 0.8247; ...
                      2.1797; 0.8836; 2.2386; 0.9425; 2.2975; 1.0015; 2.3564; ...
                      1.0604; 2.4153; 1.1193; 2.4742; 1.1782; 2.5331; 1.2371; ...
                      2.592; 1.296];

    opt.STC_referenceSlice = [];

    % Options for normalize
    % Voxel dimensions for resampling at normalization of functional data or leave empty [ ].
    opt.funcVoxelDims = [2.6 2.6 2.6];
    opt.space = 'MNI';

    %     % Save the opt variable as a mat file to load directly in the preprocessing
    %     % scripts
    %     save('opt.mat', 'opt');

end
