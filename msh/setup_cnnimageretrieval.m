function setup_cnnimageretrieval()
% SETUP_CNNIMAGERETRIEVAL Setup the toolbox.


[root] = fileparts(mfilename('fullpath')) ;

% add paths from this package
addpath(fullfile(root, 'cnnblocks'));
addpath(fullfile(root, 'cnninit'));
addpath(fullfile(root, 'cnntrain'));
addpath(fullfile(root, 'cnnvecs'));
addpath(fullfile(root, 'examples'));
addpath(fullfile(root, 'utils')); 