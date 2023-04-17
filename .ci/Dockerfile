# Last updated 02/04/2022 (to rebuild the docker image, update this timestamp)
# The Flutter version is not important here, since the CI scripts update Flutter
# before running. What matters is that the base image is pinned to minimize
# unintended changes when modifying this file.
FROM cirrusci/flutter@sha256:d99b1ba2602240a74722970b5c0cd704bbe60a7eba7557157c784f2f693c393f

RUN sudo apt-get update && \
    sudo apt-get upgrade --yes && \
    sudo apt-get install --yes gpg-agent && \
    sudo apt-get clean --yes

# This must occur after the install of gpg-agent
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -

# Install formatter for C-based languages.
RUN apt-get install -y clang-format

# Install Linux desktop build requirements.
RUN apt-get install -y clang cmake ninja-build file pkg-config libgtk-3-dev 

# Needed for web_benchmarks
RUN sudo apt-get install -y libgbm-dev

RUN yes | sdkmanager \
    "platforms;android-27" \
    "build-tools;27.0.3" \
    "extras;google;m2repository" \
    "extras;android;m2repository"

RUN yes | sdkmanager --licenses
