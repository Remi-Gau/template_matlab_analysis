function results = my_fibonacci(varargin)
    %
    % Returns vector of n iterations of the Fibonacci sequence.
    %
    % USAGE::
    %
    %   results = my_fibonacci(nb_iterations)
    %
    % :param foo: Optional argument. Number of iterations to run. Default = 5;
    % :type foo: positive integer
    %
    % :returns: - :results: (array) (1 x nb_iterations + 2)
    %
    % Example::
    %
    %     results = my_fibonacci(5);
    %

    % (C) Copyright 2022 Remi Gau

    is_positive_integer = @(n) (rem(n, 1) == 0) & (n > 0);

    default_nb_iterations = 5;

    args = inputParser;
    addOptional(args, 'nb_iterations', default_nb_iterations, is_positive_integer);
    parse(args, varargin{:});

    nb_iterations = args.Results.nb_iterations;

    results = [0 1];

    for i = 1:nb_iterations
        results(end + 1) = results(end - 1) + results(end);
    end

end
