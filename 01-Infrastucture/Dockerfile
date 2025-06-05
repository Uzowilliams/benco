#Get a base image from docker hub
FROM nginx:latest

RUN rm -rf /usr/share/nginx/html*

#Define working directory
WORKDIR /usr/share/nginx/html

#Copy from host to container
COPY . /usr/share/nginx/html

#Expose port
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]