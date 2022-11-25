function num_instances = count_line_rst_style_help(file, line)
    %
    % Counts the number of times a line occurs. Case-sensitive.
    % White space padding are ignored.
    %
    % USAGE::
    %
    %   num_instances = count_line_google_style_help(file, line)
    %
    % :param file: content of file to scan
    % :type cellstr:
    %
    % :param line: the line to count
    % :type char:
    %
    %
    % :returns: - :num_instances: (int) the number of times the line occurs.
    %

    % (C) Copyright 2022 Remi Gau

    % inspired from https://goodresearch.dev/docs.html#write-docstrings

    % remove right whitespace
    file = cellfun(@(x) deblank(x), file, 'UniformOutput', false);

    % count number of instances
    num_instances = sum(strcmp(file, line));

end
