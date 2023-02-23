FROM openjdk:slim

RUN apt-get update -y && apt-get install -y curl

# Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Firebase CLI
RUN npm install -g firebase-tools

WORKDIR /app
COPY firebase.json ./

# ui
EXPOSE 4000

# firestore
EXPOSE 8080

CMD ["firebase", "emulators:start", "--project", "playground"]
