#!/usr/bin/env bash -x

SOURCE="http://s3.amazonaws.com/ec2metadata/ec2-metadata"
DEST="/usr/local/bin/ec2-metadata"


/usr/bin/curl --silent ${SOURCE} > ${DEST} && /bin/chmod 755 ${DEST}


