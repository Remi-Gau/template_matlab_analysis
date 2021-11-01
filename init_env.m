%
% 1 - Check if version requirements
% are satisfied and the packages are
% are installed/loaded:
%   Octave > 4
%       - image
%       - optim
%       - struct
%       - statistics
%
%   MATLAB >= R2015b
%
% 2 - Add project to the O/M path

function initEnv

    octaveVersion = '4.0.3';
    matlabVersion = '8.6.0';

    installlist = {'io', 'statistics', 'image'};

    if isOctave

        % Exit if min version is not satisfied
        if ~compare_versions(OCTAVE_VERSION, octaveVersion, '>=')
            error('Minimum required Octave version: %s', octaveVersion);
        end

        for ii = 1:length(installlist)

            packageName = installlist{ii};

            try
                % Try loading Octave packages
                disp(['loading ' packageName]);
                pkg('load', packageName);

            catch

                tryInstallFromForge(packageName);

            end
        end

    else % MATLAB ----------------------------

        if verLessThan('matlab', matlabVersion)
            error('Sorry, minimum required version is R2017b. :(');
        end

    end

    % If external dir is empty throw an exception
    % and ask user to update submodules.
    libDirectory = fullfile(fileparts(mfilename('fullpath')), 'lib');

    if numel(dir(libDirectory)) <= 2 % Means that the external is empty
        error(['Git submodules are not cloned!', ...
               'Try this in your terminal:', ...
               ' git submodule update --recursive ']);
    else
        addDependencies();
    end

    disp('Correct matlab/octave verions and added to the path!');

end

function retval = isOctave
    % Return: true if the environment is Octave.
    persistent cacheval   % speeds up repeated calls

    if isempty (cacheval)
        cacheval = (exist ('OCTAVE_VERSION', 'builtin') > 0);
    end

    retval = cacheval;

end

function tryInstallFromForge(packageName)

    errorcount = 1;
    while errorcount % Attempt twice in case installation fails
        try
            pkg('install', '-forge', packageName);
            pkg('load', packageName);
            errorcount = 0;
        catch err
            errorcount = errorcount + 1;
            if errorcount > 2
                error(err.message);
            end
        end
    end

end

function addDependencies()

    pth = fileparts(mfilename('fullpath'));
    addpath(genpath(fullfile(pth, 'lib')));
    addpath(genpath(fullfile(pth, 'src')));

end
