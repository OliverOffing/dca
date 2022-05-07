FROM bitnami/jupyter-base-notebook:2.1.1
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN jupyter nbextension install --py jupytext --user
RUN jupyter nbextension enable --py jupytext --user
ARG WORKDIR=/home
WORKDIR ${WORKDIR}
