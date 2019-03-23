# Hawkeye

Hawkeye is a custom, open-source home security and monitoring solution.
This solution is powered by the Raspberry Pi, Python, AWS, and Docker.

I am a full-time software/data engineer with a lot of experience managing
and architecting data solutions, as well as leveraging Amazon Web Services (AWS).
For these reasons, I've decided to start this project and try to put my own
personal flair on the home security design.

I am building Hawkeye for my own personal use as a hobby and interest;
however, I would love to see what others can do to tinker with this project,
or just receive feedback if you find it useful/interesting.

---

## Getting Started

First, open up the `.env` file at the root of this project, and populate
the environment variables with your appropriate settings.

> Note: this configuration does require you have an AWS account and a SNS topic to send alerts to.

Next, build the Docker image using:  
```
make build
```
Or:
```
docker build -t hawkeye .
```

At this point, you are now ready to run any of the services which make up this security system. For example, to run the laser alarm:
```
docker-compose up laser_alarm
```

> Note: see the `docker-compose.yml` file for all the services.

## Documentation

Further documentation is pending and I will try to add it as I develop more services and changes. However, feel free to dig into
the code, fork, issue pull requests, or provide feedback!