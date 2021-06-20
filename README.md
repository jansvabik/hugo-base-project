# Hugo base project

This repository contains a sample [Hugo](https://gohugo.io/) project. It can be forked, cloned or copied for starting new project with this technology. However, there are more technologies and processes implemented for minimizing human actions during starting new project.

## Scripts

There are several scripts which make the development process faster and more comfortable. They are located in `scripts` directory and they are usually added to `Makefile` for simpler usage.

### New component

There is a `make component name=component-name` command for adding new component. It automatically creates `.scss` and `.html` file in corresponding directories, which are:

* for `.scss` file -> `assets/sass/components/_component-name.scss`
* for `.html` file -> `layouts/partials/components/component-name.html`
* it also includes the `.scss` file to `assets/sass/main.scss` file

After checking that those files still don't exist and creating them, it'll also automatically open them in VS Code, if installed with CLI.