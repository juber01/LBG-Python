#Use Python 3.11 as a base image
FROM python:3.11

# Copy contents into image
COPY . .

# Install pip dependencies from requirements
RUN pip install -r requirements.txt

ENV APPPORT=8080

# Expose the correct port
EXPOSE ${APPPORT}

# Create an entrypoint
ENTRYPOINT [ "python", "lbg.py" ]