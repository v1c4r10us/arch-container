```bash
    _          _    _ _                __  _____ ___ ___ _ _  
   /_\  _ _ __| |_ | (_)_ _ _  ___ ____\ \/ / __/ __| __| | | 
  / _ \| '_/ _| ' \| | | ' \ || \ \ /___>  <| _| (__| _||_  _|
 /_/_\_\_| \__|_||_|_|_|_||_\_,_/_\_\  /_/\_\_| \___|___| |_| 
 |   \ ___  __| |_____ _ _                                    
 | |) / _ \/ _| / / -_) '_|                                   
 |___/\___/\__|_\_\___|_|                                     
                                                              
```
# Intro
This project is about an ArchLinux instance with desktop environment XFCE4, this instance run into docker container and the graphical access is over noVNC protocol (any browser).

# Resources
It can be executed in any cloud instance (GCP, AWS or Azure), from cloud-shell service. Is possible execute into local machine too.

# Commands

**`Build container`**
```bash
docker build -t myarch .
```

**`Run container enabling VNC service`**
```bash
docker run -it -d -p 8081:8081 --name arch-vnc myarch bash -c "vncserver :1"
```

**`Enable access noVNC for any browser`**
```bash
docker exec -d arch-vnc bash -c "novnc --listen 8081 --vnc localhost:5901"
```

**`Connect to container from Browser`**
<p align="center"><img src="https://drive.google.com/uc?export=view&id=1l5tR4CGXPquYHBRMw_hLxJGJHjf2ebzN"/></p>

**`Stop container`**
```bash
docker stop arch-vnc
```

**`Start container`**
```bash
docker start arch-vnc
```

**WARNING!!:** The changes aren't ephimeral while start/stop **arch-vnc** container, if you prune this all changes lost.
