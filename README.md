# Template for Instalation of OS Ticket with Docker

osTicket is a widely-used open source support ticket system. It seamlessly integrates inquiries created via email, phone and web-based forms into a simple easy-to-use multi-user web interface. Manage, organize and archive all your support requests and responses in one place while providing your customers with accountability and responsiveness they deserve.

Whit this template is possible to install OS Ticket in a development environment to test and learning.

# Initial Instructions

Clone the project from the repository

```
git clone git@github.com:JoshuaWebDev/myosticket.git
```

Access the project directory

```
cd myosticket
```

Download the latest version of the [osticket](https://osticket.com/download/) and copy to myosticket directory.

Execute the command

```
docker-compose up -d
```

Execute the command

```
docker exec -it install.sh
```