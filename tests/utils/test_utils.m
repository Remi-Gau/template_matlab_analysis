function test_suite = test_utils %#ok<*STOUT>
    %
    % (C) Copyright 2022 Remi Gau

    try % assignment of 'localfunctions' is necessary in Matlab >= 2016
        test_functions = localfunctions(); %#ok<*NASGU>
    catch % no problem; early Matlab versions can use initTestSuite fine
    end

    initTestSuite;

end

function test_get_version_smoke_test()

    results = get_version();

end

function test_root_dir_smoke_test()

    results = root_dir();

end

function test_is_octave_smoke_test()

    results = is_octave();

end
