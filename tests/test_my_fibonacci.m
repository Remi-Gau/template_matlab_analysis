function test_suite = test_my_fibonacci %#ok<*STOUT>
    %
    % (C) Copyright 2022 Remi Gau

    try % assignment of 'localfunctions' is necessary in Matlab >= 2016
        test_functions = localfunctions(); %#ok<*NASGU>
    catch % no problem; early Matlab versions can use initTestSuite fine
    end

    initTestSuite;

end

function test_my_fibonacci_basic()

    % GIVEN
    nb_iterations = 6;

    % WHEN
    results = my_fibonacci(nb_iterations);

    % THEN
    assertEqual(results, [0, 1, 1, 2, 3, 5, 8, 13]);

end

function test_my_fibonacci_default()

    % WHEN
    results = my_fibonacci();

    % THEN
    assertEqual(results, [0, 1, 1, 2, 3, 5, 8]);

end

function test_my_fibonacci_error()

    if ~is_octave()
        assertExceptionThrown(@()my_fibonacci(-1), 'MATLAB:InputParser:ArgumentFailedValidation');
    end

end
