FROM uphy/ubuntu-desktop-jp:16.04

# Install development tools.
RUN apt-get update && \
    apt-get install -y \
      git \
      && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*


# Install Visual Studio Code
RUN mkdir -p /usr/local/vscode && \
    wget -qO- https://go.microsoft.com/fwlink/?LinkID=620884 | tar zx --strip-components=1 -C /usr/local/vscode && \
    ln -s /usr/local/vscode/code /usr/local/bin/code && \
    /usr/local/vscode/bin/code --user-data-dir='.' --install-extension lukehoban.Go


COPY files /
