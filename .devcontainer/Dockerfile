# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.236.0/containers/python-3-anaconda/.devcontainer/base.Dockerfile

FROM mcr.microsoft.com/vscode/devcontainers/anaconda:0-3

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
ARG NODE_VERSION="none"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# Copy environment.yml (if found) to a temp location so we update the environment. Also
# copy "noop.txt" so the COPY instruction does not fail if no environment.yml exists.
COPY environment.yml* .devcontainer/noop.txt /tmp/conda-tmp/
RUN if [ -f "/tmp/conda-tmp/environment.yml" ]; then umask 0002 && /opt/conda/bin/conda env update -n base -f /tmp/conda-tmp/environment.yml; fi \
    && rm -rf /tmp/conda-tmp

# [Optional] Uncomment this section to install additional OS packages.
# These packages are to get PDF export via LaTeX (minimal) and via webpdf
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends pandoc \
     texlive-xetex texlive-fonts-recommended texlive-plain-generic latexmk\
     xorg xvfb gtk2-engines-pixbuf \
     dbus-x11 xfonts-base xfonts-100dpi xfonts-75dpi xfonts-cyrillic xfonts-scalable \
     libnss3-dev libxss1 libcups2 libasound2 libpangocairo-1.0-0 libatk1.0-0 libatk-bridge2.0-0 libgtk-3-0 \
     nodejs npm libzmq3-dev tree

     
# Hack for controlling how chromium works with no-sandbox and allow-downloads
RUN mkdir -p /home/vscode/.jupyter \
    mkdir -p /home/vscode/.local/share/jupyter/dictionaries \
    mkdir -p /home/vscode/.jupyter/lab/user-settings/\@ryantam626\jupyterlab_code_formatter \
    mkdir -p /home/vscode/.jupyter/lab/user-settings/\@jupyterlab/shortcuts-extension

COPY .devcontainer/jupyter_nbconvert_config.py /home/vscode/.jupyter/jupyter_nbconvert_config.py
COPY .devcontainer/jupyter_lab_config.py /home/vscode/.jupyter/jupyter_lab_config.py
COPY .devcontainer/jupyter_server_config.json /home/vscode/.jupyter/jupyter_server_config.json

COPY .devcontainer/en_US.dic /home/vscode/.local/share/jupyter/dictionaries/en_US.dic
COPY .devcontainer/en_US.aff /home/vscode/.local/share/jupyter/dictionaries/en_US.aff

# For code formatting
COPY .devcontainer/jupyterlab-code-formatter.json /home/vscode/.jupyter/lab/user-settings/\@ryantam626/jupyterlab_code_formatter/settings.jupyterlab-settings
COPY .devcontainer/keyboard-shortcuts.json /home/vscode/.jupyter/lab/user-settings/\@jupyterlab/shortcuts-extension/shortcuts.jupyterlab-settings

RUN python -m pip install --upgrade pip \
    && python -m pip install pycse nbconvert nbconvert[webpdf] \
    plotly \
    pytest \
    black flake8 pylint nbmake\
    pycse pint quantities pyDOE2\
    lmfit pysr autograd jax[cpu] \
    jupyterquiz jupyter-book \
    ipywebrtc \
    jupyterlab-git jupyter-videochat jupyterlab_latex \
    jupyterlab-spellchecker \
    jupyterlab-code-formatter \
    jupyterlab-spreadsheet-editor ipysheet\
    sidecar \
    && jupyter labextension install plotlywidget \
    && jupyter labextension install jupyter-webrtc \
    && jupyter labextension install jupyterlab-spreadsheet \
    && pip install jupyterlab_markup \
    && pip install jupyterlab-lsp==3.10.1 jupyter-lsp==1.5.1 \
    && pip install 'python-lsp-server[all]' \
    && pip install jupyterlab-snippets \
    && mkdir -p /home/vscode/.local/share/jupyter

COPY .devcontainer/pycodestyle /home/vscode/.config/pycodestyle

COPY .devcontainer/snippets /home/vscode/.local/share/jupyter/snippets

# Make sure we save widgets. why would you not want this?    
RUN mkdir -p /home/vscode/.jupyter/lab/user-settings/@jupyter-widgets/jupyterlab-manager/ \
    && echo "{\"saveState\": true}" > /home/vscode/.jupyter/lab/user-settings/@jupyter-widgets/jupyterlab-manager/plugin.jupyterlab-settings

# Make sure everything in vscode belongs to vscode
RUN chown -R vscode:vscode /home/vscode

ENV SHELL=/bin/bash

# Here I try to setup all this in the vscode userspace
# this should avoid some warnings about using pip as root
USER vscode
RUN pyppeteer-install \
    && mv /home/vscode/.local/share/pyppeteer/local-chromium/588429/chrome-linux/chrome /home/vscode/.local/share/pyppeteer/local-chromium/588429/chrome-linux/chrome-exe 

COPY .devcontainer/chrome /home/vscode/.local/share/pyppeteer/local-chromium/588429/chrome-linux/chrome

RUN pip install jupyterlab-link-share \
    && jupyter server extension disable nbclassic  
