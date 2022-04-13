function setup()
    %
    % USAGE::
    %
    %   setup()
    %
    % - Add code to the path
    % - Check if MATLAB / Octave version requirements
    %    - Octave > 4
    %    - MATLAB >= R2015b
    % - For Octave loads extra packages
    %
    %
    % (C) Copyright 2022 Remi Gau

    octave_min_version = '4.0.3';
    matlab_min_version = '8.6.0';

    package_list = {'io', 'statistics', 'image'};

    disp('Adding code to the path.');
    pth = fileparts(mfilename('fullpath'));
    addpath(genpath(fullfile(pth, 'src')));

    % add libraries here
    lib_directory = fullfile(root_dir(), 'lib'); %#ok<NASGU>

    disp('checking MATLAB / Octave version.');
    if is_octave()

        % Exit if min version is not satisfied
        if ~compare_versions(OCTAVE_VERSION, octave_min_version, '>=')
            error('Minimum required Octave version: %s', octave_min_version);
        end

        for ii = 1:length(package_list)

            package_name = package_list{ii};

            try
                % Try loading Octave packages
                disp(['loading ' package_name]);
                pkg('load', package_name);

            catch

                try_install_from_forge(package_name);

            end
        end

    else % MATLAB

        if verLessThan('matlab', matlab_min_version)
            error('Sorry, minimum required version is R2017b. :(');
        end

    end

end

function try_install_from_forge(package_name)
    %
    % Attempt twice in case of installation fails
    %

    errorcount = 1;
    while errorcount
        try
            pkg('install', '-forge', package_name);
            pkg('load', package_name);
            errorcount = 0;
        catch err
            errorcount = errorcount + 1;
            if errorcount > 2
                error(err.message);
            end
        end
    end

end
