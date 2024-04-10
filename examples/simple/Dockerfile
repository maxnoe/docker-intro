# we use another, standard image as the basis for ours
FROM almalinux:9

# We can execute commands to install software
RUN dnf install -y python3.11 python3.11-pip

# we can add data from the local directory
ADD hello.py /opt/hello.py

# default command to execute
CMD ["python3.11", "/opt/hello.py"]
