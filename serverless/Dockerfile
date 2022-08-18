FROM node:16.15.1-slim

RUN apt-get update && apt-get install  -y curl unzip && apt-get clean
RUN npm i -g serverless
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/awscliv2.zip"
RUN unzip /awscliv2.zip
RUN ls -la ; 
RUN ./aws/install
RUN rm /awscliv2.zip; rm -rf /awscliv2
RUN mkdir /app
WORKDIR /app
