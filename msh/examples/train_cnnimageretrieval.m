
clear;

%-------------------------------------------------------------------------------
% Set data folder
%-------------------------------------------------------------------------------

% Set data folder, change if you have downloaded the data somewhere else
data_root = fullfile(get_root_cnnimageretrieval(), 'data');
% Check, and, if necessary, download train data (dbs, and original images), 
% and pre-trained imagenet networks
download_train(data_root);





%% VGG -------------------------------------------------------------------------
clear opts

% Set architecture and initialization parameters
opts.init.model = 'VGG'; % (ALEX | VGG | GOOGLENET | RESNET101)
opts.init.modelDir = fullfile(data_root, 'networks', 'imagenet');
opts.init.method = 'gem'; % (gem: one p for all filters | gemmp: one p per filter)
opts.init.objectiveType = {'contrastiveloss', 0.75}; 
opts.init.errorType = {'batchmap'};

% Set train parameters

opts.train.dbPath = fullfile(data_root, 'train', 'dbs', 'retrieval-SfM-120k.mat');
opts.train.batchSize = 5;
opts.train.numEpochs = 30;
opts.train.learningRate = 10^-6 * exp(-0.1 * [0:99]);
opts.train.solver = @solver.adam;
opts.train.numNegative = 5;
opts.train.numRemine = 3;
opts.train.gpus = [1];

opts.train.augment.epochSize = [6000, 22000];
opts.train.augment.imageDir = fullfile(data_root, 'train', 'ims');
opts.train.augment.imageSize = 362; 

% Trial name (to name a save directory)
trialName = 'test';

% Export directory expDir named after model, method and trialName
opts.init.method = [opts.init.method, '_', trialName];
opts.train.expDir = fullfile(data_root, 'networks', 'exp', [lower(opts.init.model) '_' lower(opts.init.method)]);
if ~exist(opts.train.expDir); mkdir(opts.train.expDir); end % create folder if its not there

% Load opts by respecting added opts
opts = load_opts_train(opts);

% Initialize and train the network
fprintf('>> Experiment folder is set to %s\n', opts.train.expDir);
net = init_network(opts.init);
[net, state, stats] = train_network(net, @(o,i,n,b,s,m,e) get_batch(o,i,n,b,s,m,e), opts.train);


