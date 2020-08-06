**Unit tests and coverage**

[![](https://img.shields.io/badge/Octave-CI-blue?logo=Octave&logoColor=white)](https://github.com/Remi-gau/template_matlab_analysis/actions)
![](https://github.com/Remi-gau/template_matlab_analysis/workflows/CI/badge.svg) 

[![codecov](https://codecov.io/gh/Remi-gau/template_matlab_analysis/branch/master/graph/badge.svg)](https://codecov.io/gh/Remi-gau/template_matlab_analysis)

**Miss_hit linter**

[![Build Status](https://travis-ci.com/Remi-gau/template_matlab_analysis.svg?branch=master)](https://travis-ci.com/Remi-gau/template_matlab_analysis)


# Template repository for matlab analysis project


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
├── .github  # where you put anything github related
│   └── workflows # where you define your github actions
│       └── moxunit.yml # a yaml file that defines a github action
├── lib # where you put the code from external libraries (mathworks website or other github repositories)
│   └── README.md
├── src # where you put your code
│   ├── README.md
│   └── miss_hit.cfg
├── tests # where you put your unit tests
|   ├── README.md
|   └── miss_hit.cfg
├── .travis.yml # where you define the continuous integration done by Travis
├── LICENSE
├── README.md
├── environment.yml # a simple environment for anything python related in this repo
├── miss_hit.cfg # configuration file for the matlab miss hit linter
└── initEnv.m # a .m file to set up your project (adds the right folder to the path)
```

## Keeping your code stylish: miss hit linter

## Python environment

More on this [here](https://the-turing-way.netlify.app/reproducible-research/renv/renv-package.html)

```bash
# create env
conda create --name crc_nighres python=3.7 

# activate it
conda activate crc_nighres

# deactivate it
conda deactivate

# export package list in the env into a YAML file
conda env export > environment.yml

# create env from YAML file
conda env create -f environment.yml

```

- [Conda cheat sheet](https://docs.conda.io/projects/conda/en/4.6.0/_downloads/52a95608c49671267e40c689e0bc00ca/conda-cheatsheet.pdf)

## Testing your code

## Continuous integration

## How to install and use this template

### Download with git

``` bash
cd fullpath_to_directory_where_to_install
# use git to download the code
git clone https://github.com/cpp-lln-lab/CPP_BIDS.git
# move into the folder you have just created
cd CPP_BIDS
# add the src folder to the matlab path and save the path
matlab -nojvm -nosplash -r "addpath(fullfile(pwd, 'src')); savepath ();"
```

Then get the latest commit:
```bash
# from the directory where you downloaded the code
git pull origin master
```

To work with a specific version, create a branch at a specific version tag number
```bash
# creating and checking out a branch that will be called version1 at the version tag v0.0.1
git checkout -b version1 v0.0.1
```



