# FROM jupyter/datascience-notebook:862de146632b
FROM jupyter/r-notebook:2c0af4ab516b

RUN conda install -y -c conda-forge \
        curl \
        nodejs=13.12.0 \
        flake8 \
    && jupyter labextension install @jupyterlab/toc \
    && jupyter labextension install jupyterlab-flake8 \
    && jupyter labextension install @lckr/jupyterlab_variableinspector 

COPY themes.jupyterlab-settings /home/jovyan/.jupyter/lab/user-settings/@jupyterlab/apputils-extension/themes.jupyterlab-settings
COPY jupyter_notebook_config.py /home/jovyan/.jupyter/

USER root

RUN apt-get update \
    && apt-get -y install devscripts

USER jovyan
