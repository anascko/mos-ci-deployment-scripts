if [ -z ${SNAPSHOT_NAME} ]
then
    SNAPSHOT_NAME=$(dos.py snapshot-list "$ENV_NAME" | tail -1 | awk '{print $1}')
fi
dos.py revert-resume ${ENV_NAME} ${SNAPSHOT_NAME}
