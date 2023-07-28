function Spatial
  functionDir = fullfile(fileparts(mfilename('fullpath')), '..', 'GUI');
  addpath(functionDir);
  functionDir2 = fullfile(fileparts(mfilename('fullpath')), '..', 'Resolutions');
  addpath(functionDir2);
  functionDir3 = fullfile(fileparts(mfilename('fullpath')), '..', 'Arithmetic');
  addpath(functionDir3);
  functionDir4 = fullfile(fileparts(mfilename('fullpath')), '..', 'Piecewise');
  addpath(functionDir4);
  functionDir5 = fullfile(fileparts(mfilename('fullpath')), '..', 'BasicIntensity');
  addpath(functionDir5);
  functionDir6 = fullfile(fileparts(mfilename('fullpath')), '..', 'Smoothing');
  addpath(functionDir6);
  functionDir7 = fullfile(fileparts(mfilename('fullpath')), '..', 'Sharpening');
  addpath(functionDir7);
end