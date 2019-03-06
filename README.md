# CoreOS Server

# Usage

1. Download bootable CoreOS image from https://coreos.com/os/docs/latest/booting-with-iso.html
2. Create bootable USB/CD with contents of CoreOS image
3. Start server and boot from CoreOS USB/CD.
4. Determine the OS installation disk
    ```bash
    # Usually /dev/sda
    sudo fdisk -l
    ```
5. Copy the ignition remote config bootstrap file to the file system
    ```bash
    # curl -O https://raw.githubusercontent.com/bradcornford/coreos/master/ignition/ignition.json
    curl https://bit.ly/2O4SF0U -o ignition.json
    ```
6. Begin CoreOS installation on specified disk, **NOTE: specified disk will be reformatted**
    ```bash
    sudo coreos-install -d /dev/sda -C stable -i ignition.json
    ```

7. On installation completion, remove bootable USB/CD
8. Restart server
9. Wait for CoreOS to start and `cloud-init` process to complete.
10. Go to `http://portainer.bcornford.co.uk` to see Portainer dashboard and begin setup.

# Server System Configuration

*/etc/sysconfig/variables* - Environment variables

*/etc/sysconfig/credentials* - Samba credentials

*/etc/sysconfig/users* - HTTP users

# Server Container Structure

    ```
    /opt
    ├── bootstrap/
    │   └── environment.sh
    │   └── filesystem.sh
    ├── containers/
    │   └── ...
    ├── services/
    │   └── netdata/
    │   └── portainer/
    │   └── traefik/
    ```

# Server Mount Points

    ```
    /mnt/
    ├── drive1/
    ├── drive2/
    ├── nas1/
    ├── nas2/
    ```

# Server Media Structure

    ```
    /media
    ├── storage/
    │   ├── archive/
    │   │   ├── movies/
    │   │   ├── music/
    │   │   ├── tvshows/
    │   ├── movies/
    │   ├── music/
    │   ├── tvshows/
    ├── temp/
    │   ├── blackhole/
    │   │   ├── movies/
    │   │   ├── music/
    │   │   ├── tvshows/
    │   ├── downloads/
    │   │   ├── movies/
    │   │   ├── music/
    │   │   ├── tvshows/
    │   └── processing/
    ```
