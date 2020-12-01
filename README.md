<!--

When you have set up your repo

**Unit tests and coverage**

[![](https://img.shields.io/badge/Octave-CI-blue?logo=Octave&logoColor=white)](https://github.com/Remi-gau/template_matlab_analysis/actions)
![](https://github.com/Remi-gau/template_matlab_analysis/workflows/CI/badge.svg)

[![codecov](https://codecov.io/gh/Remi-gau/template_matlab_analysis/branch/master/graph/badge.svg)](https://codecov.io/gh/Remi-gau/template_matlab_analysis)

**Miss_hit linter**

[![Build Status](https://travis-ci.com/Remi-gau/template_matlab_analysis.svg?branch=master)](https://travis-ci.com/Remi-gau/template_matlab_analysis)

-->

# Template repository for matlab analysis project

## How to install and use this template

### Install with Git

1. Click the green button `Use this template`.

1. Give a name to the repository you want to create. Something short that
   contains the name of your experiment: `analysis_my_study`.

1. Decide if you want this new repo to be public or private.

1. Click on `Create repository from template`

You now have a copy of the template on your Github account. You can then
download the code and the pre-set dependencies like this.

1. Click on green `Download` button and copy the `URL_to_your_repo` that is
   shown there.

1. Open a terminal and type this:

```bash
git clone --recurse-submodules URL_to_your_repo
```

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
