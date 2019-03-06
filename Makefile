compile:
    echo "writing config to: ./ignition/ignition.json"
    ct -strict -pretty -in-file ./container-linux-config/container-linux-config.yml -out-file ./ignition/ignition.json -files-dir=./files/ -platform=custom

    for file in ./container-linux-config/append/*
    do
        if [[ -f $file ]]; then
            echo "writing config to: ./ignition/ignition.d/$(basename ${file%.yml}).json"
            ct -strict -pretty -in-file $file -out-file ./ignition/ignition.d/$(basename ${file%.yml}).json -files-dir=./files/ -platform=custom
        fi
    done