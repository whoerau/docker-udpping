# docker-udpping


### Step 1

Set up a udp echo server at the host you want to ping. 

There are many ways of doing this, my favourite way is:

```
socat -v UDP-LISTEN:5000,fork PIPE
```

Now a echo server is listening at port 5000. 

###### Note
If you dont have socat, use `apt install socat` or `yum install socat`, you will get it.

### Step 2

Ping you server.

Assume `ip` is the IP of your server.

```
docker run -it --rm udpping:latest ip 5000
```

Done!
