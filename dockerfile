FROM centos/nodejs-12-centos7:latest
USER root
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py
RUN pip install awscli
ADD your_node_script.js /usr/local/bin/your_node_script.js
WORKDIR /scratch
USER nobody
CMD node -e 'require("/usr/local/bin/your_node_script.js").startExecution()'
