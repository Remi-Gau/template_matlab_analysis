<!--
When you have set up your repo you may need to change those badges
-->

[![MISS_HIT](https://github.com/Remi-Gau/template_matlab_analysis/actions/workflows/miss_hit.yml/badge.svg?branch=main)](https://github.com/Remi-Gau/template_matlab_analysis/actions/workflows/miss_hit.yml)
[![MATLAB: test and coverage](https://github.com/Remi-Gau/template_matlab_analysis/actions/workflows/matlab_test_and_coverage.yaml/badge.svg)](https://github.com/Remi-Gau/template_matlab_analysis/actions/workflows/matlab_test_and_coverage.yaml)
[![Octave: test and coverage](https://github.com/Remi-Gau/template_matlab_analysis/actions/workflows/octave_test_and_coverage.yml/badge.svg?branch=main)](https://github.com/Remi-Gau/template_matlab_analysis/actions/workflows/octave_test_and_coverage.yml)
[![codecov](https://codecov.io/gh/Remi-Gau/template_matlab_analysis/branch/master/graph/badge.svg?token=aFXb7WSAsm)](https://codecov.io/gh/Remi-Gau/template_matlab_analysis)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Documentation Status: latest](https://readthedocs.org/projects/template_matlab_analysis/badge/?version=latest)](https://template_matlab_analysis.readthedocs.io/en/latest/?badge=latest)
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Remi-Gau/template_matlab_analysis/main)

- [Template repository for MATLAB / Octave projects](#template-repository-for-matlab--octave-projects)
   - [How to install and use this template](#how-to-install-and-use-this-template)
      - [Install with Github](#install-with-github)
      - [Install with cookiecutter](#install-with-cookiecutter)
   - [Configuration](#configuration)

# Template repository for MATLAB / Octave projects

## How to install and use this template

### Install with Github

1. Click the green button `Use this template`.

![](https://user-images.githubusercontent.com/6961185/167254070-b6fd34dc-1334-41c5-b0a6-eb7234f008d9.jpg)

<hr>

2. Give a name to the repository you want to create. Something short that
   contains the name of your project: `analysis_my_study`.

![](https://user-images.githubusercontent.com/6961185/167254100-ad4eaa48-36a9-4dee-947e-d6957ab6d8a5.png)

<hr>

3. Decide if you want this new repo to be public or private.

4. Click on `Create repository from template`

   You now have a copy of the template on your Github account. You can then
   download the code and the pre-set dependencies like this.

5. Click on green `Download` button and copy the `URL_to_your_repo` that is
   shown there.

6. Open a terminal and type this:

```bash
git clone URL_to_your_repo
```

### Install with cookiecutter

Install Cookiecutter:

```bash
pip install -U cookiecutter
```

Generate project:

```bash
cookiecutter https://github.com/Remi-Gau/cookiecutter_matlab_analysis.git
```

## Configuration

Check the
[CONTRIBUTING.md](https://github.com/Remi-Gau/template_matlab_analysis/blob/main/CONTRIBUTING.md)
for more information on setting up this repo.
