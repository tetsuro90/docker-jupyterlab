FROM jupyter/datascience-notebook:862de146632b

# COPY requirements.txt /tmp/requirements.txt

RUN conda install -y -c conda-forge \
        curl \
        nodejs=13.12.0 \
        flake8 \
    && jupyter labextension install @jupyterlab/toc \
    && jupyter labextension install jupyterlab-flake8 \
    && jupyter labextension install @lckr/jupyterlab_variableinspector

COPY themes.jupyterlab-settings /home/jovyan/.jupyter/lab/user-settings/@jupyterlab/apputils-extension/themes.jupyterlab-settings
COPY jupyter_notebook_config.py /home/jovyan/.jupyter/