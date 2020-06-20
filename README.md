## A hook for modify container's route at prestart stage.

### Only works in CentOS Atomic.

### The hook works as follows:

Modify a container's route on prestart stage. When a container is 
created and before it started(prestart stage), this script will be 
called , and it will use JSON.awk to parse container's status 
file(json) to get the respective image name, and then parse a txt 
file contains route info(HadoopContainerRoute.txt), finally add 
the route rule to container's route table.

briefly:

```
container created
       |
       |
 prestart stage  ---call--->  route-settings
                                   | 
				   |
            parse config.v2.json and get container's image name
                                   |
                                   |
            judge if the container's route should be modified
                       |                        |
                       | No                     |Yes
           skip and exit with code 0    get the container's PID and link ns
                                                |
                                                |
                                parse route.txt and add route rule
      __________________________________________|
      |
      |
container start 
      |
container running
```

#### files:

- JSON.awk(/tmp/JSON.awk)
  a awk script for parse json

- Route.txt(/run/initramfs/live/Route.txt)
  the route rules for adding to container

- route-settings(/usr/libexec/oci/hooks.d/route-settings)
  the hook

- route-settings.json(/usr/share/containers/oci/hooks.d/route-settings.json)
  for specifying the location of hook
