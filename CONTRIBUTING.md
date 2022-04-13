# CONTRIBUTING

Information for anyone who would like to contribute to this repository.

## Repository map

```bash
├── .git
├── .github
│   └── workflows         # Github continuous integration set up
├── examples              # Python demos: jupyter notebooks
│   ├── data
│   ├── example1outputs
│   ├── example2outputs
├── glmsingle             # Python implementation
│   ├── cod
│   ├── design
│   ├── gmm
│   ├── hrf
│   ├── ols
│   ├── ssq
│   └── utils
├── matlab                # MATLAB implementation
│   ├── examples          # MATLAB demos
│   ├── fracridge
│   └── utilities
└── tests                 # Python and MATLAB tests
    └── data

```

### Makefile

### pre-commit

### Style guide

### Tests

### Docs

# Setting up sphinx to create a matlab doc

## Set up virtual environment

```bash
virtualenv -p python3 your_repo_name
source your_repo_name/bin/activate

pip install -r requirements.txt
```

## Quick start on the doc

See the [sphinx doc](https://www.sphinx-doc.org/en/master/usage/quickstart.html)
for more.

This
[blog post](https://medium.com/@richdayandnight/a-simple-tutorial-on-how-to-document-your-python-project-using-sphinx-and-rinohtype-177c22a15b5b)
is also useful.

```bash
cd docs
sphinx-quickstart # launch a basic interactive set up of sphinx
```

Answer the questions on prompt.

## Setting up conf.py for matlab doc

Following the documentation from
[matlabdomain for sphinx](https://github.com/sphinx-contrib/matlabdomain).

Specify the extensions you are using:

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

## reStructured text markup

reStructured text mark up primers:

-   on the [sphinx site](https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html)

-   more
    [python oriented](https://pythonhosted.org/an_example_pypi_project/sphinx.html)

-   typical doc strings templates
    -   [google way](https://www.sphinx-doc.org/en/master/usage/extensions/example_google.html)
    -   [numpy](https://www.sphinx-doc.org/en/master/usage/extensions/example_numpy.html#example-numpy)

## "Templates"

The templates to use for the doc are in the `src/templates` folder.

You then just need to insert this in your `.rst` file for the documentation to
be done automatically.

```rst

.. automodule:: src.folder_name .. <-- This is necessary for auto-documenting the rest

.. autofunction:: function to document

```

To get the filenames of all the functions in a folder:

``` bash
ls -l src/*.m | cut -c42- | rev | cut -c 3- | rev
```

Increase the `42` to crop more characters at the beginning.

Change the `3` to crop more characters at the end.

## Build the documentation locally

From the `docs` directory:

```bash
sphinx-build -b html source build
```

This will build an html version of the doc in the `build` folder.

## Build the documentation with Read the Docs

Add a [`.readthedocs.yml`](../.readthedocs.yml) file in the root of your repo.

See [HERE](https://docs.readthedocs.io/en/stable/config-file/v2.html) for
details.

You can then trigger the build of the doc by going to the
[read the docs website](https://readthedocs.org).

You might need to be added as a maintainer of the doc.

The doc can be built from any branch of a repo.


### Continuous integration



This will set up everything automatically in your current directory.

## Content

```bash
├── .git
│   ├── COMMIT_EDITMSG
│   ├── FETCH_HEAD
│   ├── HEAD
│   ├── ORIG_HEAD
│   ├── branches
│   ├── config
│   ├── description
│   ├── hooks
│   │   ├── pre-commit.sample
│   │   └── pre-push.sample
│   ├── ...
│   └── ...
├── .github                # where you put anything github related
│   └── workflows          # where you define your github actions
│       └── moxunit.yml    # a yaml file that defines a github action
├── lib                    # where you put the code from external libraries (mathworks website or other github repositories)
│   └── README.md
├── src                  # WHERE YOU PUT YOUR CODE
│   ├── README.md
│   └── miss_hit.cfg
├── docs                 # where you write your documentation using sphinx
│   ├── make.bat
│   ├── Makefile
│   ├── README.md
│   ├── requirements.txt # to set up the python environment for the doc
│   └── source           # the actual reStructured text file for your doc
│       ├── conf.py
│       ├── function_description.rst
│       ├── index.rst
│       ├── _static
│       └── _templates
├── tests               # where you put your unit tests
|   ├── README.md
|   └── miss_hit.cfg
├── .travis.yml         # where you define the continuous integration done by Travis
├── LICENSE
├── README.md
├── miss_hit.cfg        # configuration file for the matlab miss hit linter
└── initEnv.m           # a .m file to set up your project (adds the right folder to the path)
```

## Keeping your code stylish: miss hit linter

### Matlab code style guide and quality

We use the [MISS_HIT linter](https://github.com/florianschanda/miss_hit/) to
automatically enforce / fix some code style issues and check for code quality.

The linter is a python package that can be installed with:

```bash
pip3 install --user miss_hit
```

The rules followed by MISS_HIT are in the
[MISS_HIT configuration file](./miss_hit.cfg).

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

The code style and quality is also checked during the
[continuous integration](.github/workflows/miss_hit.yml).

For more information about MISS_HIT see its
[documentation](https://florianschanda.github.io/miss_hit/).

## Python environment

More on this
[here](https://the-turing-way.netlify.app/reproducible-research/renv/renv-package.html)

## Testing your code

The [MOxUnit testing framework](https://github.com/MOxUnit/MOxUnit) is set up to
run tests automatically for any tests in the `tests` folder.

## Continuous integration
