# CONTRIBUTING

Information for anyone who would like to contribute to this repository.

- [CONTRIBUTING](#contributing)
  - [Repository map](#repository-map)
  - [Set up](#set-up)
  - [Makefile](#makefile)
  - [Style guide](#style-guide)
  - [pre-commit](#pre-commit)
  - [Tests](#tests)
    - [Adding new tests](#adding-new-tests)
  - [Docs](#docs)
    - [`conf.py` for matlab doc](#confpy-for-matlab-doc)
    - [reStructured text markup](#restructured-text-markup)
    - [Build the documentation locally](#build-the-documentation-locally)
    - [Serve the documentation on Read the Docs](#serve-the-documentation-on-read-the-docs)
  - [Demos and binder](#demos-and-binder)
  - [Continuous integration](#continuous-integration)
  - [Notebooks](#notebooks)

## Repository map

```bash
├── .git
├── .github                 # where you put anything github related
│   └── workflows           # where you define your github actions
│       └── build.yml       # a yml file that defines a github workflow
├── docs
│   ├── create_manual.sh
│   ├── make.bat
│   ├── Makefile
│   └── source              # for the reStructured text files for your doc
│       └── conf.py         # configuration for the doc
├── src                     # WHERE YOUR CODE GO
├── lib                     # for external libraries
├── tests                   # WHERE YOUR TESTS GO
├── CITATION.cff            # on how to cite
├── CONTRIBUTING.md
├── LICENSE
├── .pre-commit-config.yaml # config for pre-commit
├── .readthedocs.yml        # config for serve the doc on read the docs
├── Makefile
├── miss_hit.cfg            # config file for miss_hit linter
├── README.md
├── requirements.txt        # python dependencies for development
├── run_tests.m             # to run all tests
├── setup.m                 # to add the correct folders to the path
└── version.txt
```

## Set up

To install all the development tools, you will need to have Python installed
(>=3.6) and run:

```bash
$ pip3 install -r requirements_dev.txt
```

## Makefile

A `Makefile` is used to help set / and automate some things.

In a terminal type `make help` to see what some of the different "recipes" you
can run with this `Makefile`.

See
[here for a short intro on using `Makefiles`](https://the-turing-way.netlify.app/reproducible-research/make.html)

## Style guide

The [`miss_hit` python package](https://misshit.org/) is used to help ensure a
consistent coding style for some of the MATLAB code.

`miss_hit` can check code style, do a certain amount of automatic code
reformatting and prevent the code complexity from getting out of hand by running
static code analysis (Static analysis can is a way to measure and track software
quality metrics without additional code like tests).

`miss_hit` is quite configurable via the use of the
[MISS_HIT configuration file](./miss_hit.cfg).

Install `miss_hit`:

```bash
$ pip3 install miss_hit
```

It is also included in `requirements_dev.txt`, so it will installed by running:

```bash
$ pip3 install -r requirements_dev.txt
```

To check the code style of the whole repository, you can can simply type:

```bash
mh_style .
```

Some styling issues can be automatically fixed by using the `--fix` flag. You
might need to rerun this command several times if there are a lot of issues.

```bash
mh_style . --fix
```

Code quality can be checked with:

```bash
mh_metric .
```

To see only the issues that "break" the code quality rules set in the
configuration file, type:

```bash
mh_metric . --ci
```

You can run all miss_hit commands at once by typing `make lint`.

The code style and quality is also checked during the continuous integration.

For more information about MISS_HIT see its
[documentation](https://florianschanda.github.io/miss_hit/).

## pre-commit

You can use the [`pre-commit` python package](https://pre-commit.com/) in this
repo to make sure you only commit properly formatted files (for example `.yml`
files).

1. Install `pre-commit`

```bash
$ pip3 install pre-commit
```

It is also included in `requirements.txt`, so it will installed by running:

```bash
$ pip3 install -r requirements.txt
```

The `.pre-commit-config.yml` file defines the checks to run when committing
files.

1. Run the following command to install the `pre-commit` "hooks"

```bash
$ pre-commit install
```

The pre-commit hooks will be run on every staged files when committing, to make
sure they comply with the rules defined in the `.pre-commit-config.yml`

## Tests

The [MOxUnit testing framework](https://github.com/MOxUnit/MOxUnit) is set up to
run tests automatically for any tests in the `tests` folder.

For an introduction to testing see
[here](https://the-turing-way.netlify.app/reproducible-research/make.html).

Running the tests require to have the following toolboxes in your MATLAB path:

- the [MOxUnit testing framework](https://github.com/MOxUnit/MOxUnit) to run the
  tests
  ([see installation procedure](https://github.com/MOxUnit/MOxUnit#installation))
- [MOcov](https://github.com/MOcov/MOcov)) to get a code coverage estimate
  ([see installation procedure](https://github.com/MOcov/MOcov#installation))

All the tests are in the `tests` folder in files starting with `test_*.m`.

To run **all** the tests and get code coverage, you can

1. type the following in a terminal

```
make coverage
```

1. run `moxunit_runtests` in MATLAB to run all `test_*.m` files in in the
   present working directory.

1. run the `run_tests.m` in MATLAB

You can also run all the tests contained in a specific `test_*.m` file directly,
by running that file only.

### Adding new tests

A typical MoxUnit test file starts with with `test_` and would look something
like this.

```matlab
function test_suite=test_sum_of_squares

    try % assignment of 'localfunctions' is necessary in Matlab >= 2016
        test_functions=localfunctions();
    catch % no problem; early Matlab versions can use initTestSuite fine
    end
    initTestSuite();

end

function test_sum_of_squares_basic

    % given
    a = 2;
    b = 3;

    % when
    result = sum_of_squares([a, b])

    % then
    expected = 13;
    assertEqual(result, expected);

end

% New tests can added as new sub functions

```

## Docs

### `conf.py` for matlab doc

Following the documentation from
[matlabdomain for sphinx](https://github.com/sphinx-contrib/matlabdomain).

The extensions used are mentioned here:

```python
extensions = [
    'sphinxcontrib.matlab',
    'sphinx.ext.autodoc']
```

`matlab_src_dir` in `docs/source/conf.py` should have the path (relative to
`conf.py`) to the folder containing your matlab code:

```python
matlab_src_dir = os.path.dirname(os.path.abspath('../../src'))
```

### reStructured text markup

reStructured text mark up primers:

- on the
  [sphinx site](https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html)

- more
  [python oriented](https://pythonhosted.org/an_example_pypi_project/sphinx.html)

- typical doc strings templates
  - [google way](https://www.sphinx-doc.org/en/master/usage/extensions/example_google.html)
  - [numpy](https://www.sphinx-doc.org/en/master/usage/extensions/example_numpy.html#example-numpy)

### Build the documentation locally

From the `docs` directory:

```bash
make html
```

This will build an html version of the doc in the `build` folder.

### Serve the documentation on Read the Docs

Add a [`.readthedocs.yml`](../.readthedocs.yml) file in the root of your repo.

See [HERE](https://docs.readthedocs.io/en/stable/config-file/v2.html) for
details.

You can then trigger the build of the doc by going to the
[read the docs website](https://readthedocs.org).

You might need to be added as a maintainer of the doc.

The doc can be built for any branch of a repo.

## Demos and binder

<!-- TODO -->

## Continuous integration

We use Github to run several workflows for continuous integration.

<!-- TODO -->

## Notebooks

Will only work if you use Octave.
