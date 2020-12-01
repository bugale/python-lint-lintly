FROM python:3.9-slim

LABEL "com.github.actions.name"="Python-Lint-Lintly"
LABEL "com.github.actions.description"="Automatic code reviewer for GitHub PRs"
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="gray-dark"

LABEL "repository"="https://https://github.com/bugale/python-lint-lintly.git"
LABEL "homepage"="https://https://github.com/bugale/python-lint-lintly.git"
LABEL "maintainer"="Bugale Bugalit <bugalit@gmail.com>"

RUN pip3 install --upgrade pip
RUN pip3 install lintly
RUN pip3 install flake8
RUN pip3 install mypy
RUN pip3 install pylint
RUN pip3 install isort

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
