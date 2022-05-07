function test_suite = test_count_lines %#ok<*STOUT>
    %
    % (C) Copyright 2022 Remi Gau

    try % assignment of 'localfunctions' is necessary in Matlab >= 2016
        test_functions = localfunctions(); %#ok<*NASGU>
    catch % no problem; early Matlab versions can use initTestSuite fine
    end

    initTestSuite;

end

function test_count_lines_all

    num_instances = count_line_google_style_help(file_fixture(), 'a 1');
    assertEqual(num_instances, 2);

    num_instances = count_line_numpy_style_help(file_fixture(), 'a 1');
    assertEqual(num_instances, 2);

    num_instances = count_line_rst_style_help(file_fixture(), 'a 1');
    assertEqual(num_instances, 2);

end

function file = file_fixture()
    file = {'This file contains:'
            'a 1 '
            '2'
            '2 a 1 '
            'one'
            'a 1'};
end
