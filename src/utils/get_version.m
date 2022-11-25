function version_number = get_version()
    %
    % Reads the version number of the pipeline from the txt file in the root of the
    % repository.
    %
    % USAGE::
    %
    %   version_number = get_version()
    %
    % :returns: - :version_number: (string) Use semantic versioning format (like v0.1.0)
    %

    % (C) Copyright 2022 Remi Gau

    try
        version_number = fileread(getRootDir(), 'version.txt');
    catch
        version_number = 'v0.1.0';
    end
end
